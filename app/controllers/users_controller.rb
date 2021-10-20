class UsersController < ApplicationController

    before_action :authorize, only: [:show]

    def create 
        new_user = User.create(user_params)
        if new_user.valid?
            session[:user_id] = new_user.id
            render json: new_user,
            status: :created
        else 
            render json: {errors: new_user.errors},
            status: :unprocessable_entity
        end 
    end 

    def show 
        user = User.find_by(id: session[:user_id])
        render json: user
    end 

    private 

    def authorize 
        render json: {error: "Not authorized"}, status: :unauthorized unless session.include? :user_id
    end 

    def user_params 
        params.permit(:username, :password, :password_confirmation)
    end 

end
