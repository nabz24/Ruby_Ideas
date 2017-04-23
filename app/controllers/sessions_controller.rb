class SessionsController < ApplicationController

    def index
    end

    def register
      user = User.create(user_params)

      if user.valid?
        session[:user_id] = user[:id]

        redirect_to "/bright_idea/#{user.id}"
      else
        flash[:errors] = user.errors.full_messages
        redirect_to '/main'
      end

    end

    def login
      user = User.find_by_email(params[:email])

      if user && user.authenticate(params[:password])
        session[:user_id] = user.id
        redirect_to "/bright_idea/#{user.id}"
      else
        redirect_to "/main"
      end

    end

    def logout
      session.delete(:user_id)

      redirect_to "/main"
    end

    private
    def user_params
      params.require(:user).permit(:name,:email,:password,:password_confirmation, :alias)
    end


  end
