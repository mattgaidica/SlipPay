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

  def sync
    connection = Shoehorn::Connection.new(Credential.find_by_key(:app_name).value, Credential.find_by_key(:app_token).value)
    User.all.each do |user|
      connection.user_token = user.tkn
      connection.receipts.each do |receipt|
        puts receipt.inspect
        params = {
          receipt_id: receipt.id,
          store: receipt.store,
          total: receipt.total,
          note: receipt.note,
          sell_date: receipt.selldate,
          modified_date: receipt.modified_date,
          created_date: receipt.created_date,
          categories: receipt.categories.map{|x| x.name}.join(', '),
          image: receipt.images.first.imgurl
        }
        system_receipt = Receipt.find_by_receipt_id(receipt.id)
        if system_receipt.nil?
          Receipt.create(params)
        else
          system_receipt.update_attributes(params) if system_receipt.modified_date != receipt.modified_date
        end
      end
    end
    render text: 'complete', :status => 200
  end
end
