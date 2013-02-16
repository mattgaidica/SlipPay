class PagesController < ApplicationController
  def index
    if ENV['URL']
      return_url = "#{ENV['URL']}/register"
    else
      return_url = "http://localhost:3000/register"
    end
    connection = Shoehorn::Connection.new(Credential.find_by_key(:app_name).value, Credential.find_by_key(:app_token).value, return_url)
    @auth_url = connection.authentication_url
  end

  def register
    if params[:tkn] && params[:uname]
      @user = User.find_by_uname(params[:uname]) || User.create(tkn: params[:tkn], uname: params[:uname])
    else
      redirect_to :root
    end
  end
end
