class UsersController < ApplicationController
    def create
        user = User.create(user_params)
        render json: {data: user, message: "User created successfully"}
    end

    def update
        id = params[:id].to_i
        user = User.find(id)
        user.update(user_params)

        render json: {message: "User updated successfully"}
    end

    def index
        render json: User.all, status: :ok
    end

    private
    def user_params
        params.permit(:email, :password)
    end
end
