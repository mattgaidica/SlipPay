class PagesController < ApplicationController
  def index
    connection = Shoehorn::Connection.new(Credential.find_by_key(:app_name).value, Credential.find_by_key(:app_token).value, 'http://localhost:3000/register')
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
