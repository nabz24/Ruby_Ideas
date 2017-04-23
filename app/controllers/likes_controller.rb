class LikesController < ApplicationController

  def create
    @user = User.find_by_id(session[:user_id])

    Like.create(user: User.find_by_id(session[:user_id]), idea: Idea.find_by_id(params[:id]))
    redirect_to "/bright_idea/#{@user.id}"

  end

  def destroy
    @user = User.find_by_id(session[:user_id])

    Like.where(user: User.find_by_id(session[:user_id]), idea: Idea.find_by_id(params[:id])).first.destroy
    redirect_to "/bright_idea/#{@user.id}"
  end

end
