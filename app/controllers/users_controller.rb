class UsersController < ApplicationController
  def index
    render json: User.all
  end

  def create
    params.require(:login)
    params.require(:first_name)
    params.require(:last_name)
    params.require(:password)

    login = params[:login]
    first_name = params[:first_name]
    last_name = params[:last_name]
    password = params[:password]
    
    hash_password = GeneratePasswordCommand.new.process(password)
    user = User.create(login: login, first_name: first_name, last_name: last_name, password_hash: hash_password)
    render json: user
  end
end
