class HomeController < ApplicationController
  def index
    render json: { message: 'Welcome to the Demo App'}
  end
end