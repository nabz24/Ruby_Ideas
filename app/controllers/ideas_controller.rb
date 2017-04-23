class IdeasController < ApplicationController


  def create

    @current_user = User.find_by_id(session[:user_id])
    @idea = @current_user.ideas.create(idea_params)

    if @idea
      redirect_to "/bright_idea/#{@current_user.id}"
    end



  end

  def destroy
    @current_user = User.find_by_id(session[:user_id])
    Idea.find(params[:id]).destroy
    redirect_to "/bright_idea/#{@current_user.id}"
  end

  def show
    @user = User.find_by_id(session[:user_id])
    @idea = Idea.find(params[:id])


  end

  private
  def idea_params
    params.require(:idea).permit(:content, :user_id)
  end




end
