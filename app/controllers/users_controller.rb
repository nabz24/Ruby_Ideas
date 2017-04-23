class UsersController < ApplicationController

before_action :check_session



  def index

    @current_user = User.find_by_id(params[:id])
    @ideas = Idea.all


  end


  def show

    @current_user = User.find_by_id(session[:user_id])
    @user = User.find_by_id(params[:id])


  end

  private

  def check_session
    if !session[:user_id]
      redirect_to '/main'
    end
  end
end
