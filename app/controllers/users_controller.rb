class UsersController < ApplicationController
    def index
        @users = User.all 
    end

    def show   
        @user = User.find(params[:id])
    end

    def create
        @user = User.new(user_params)
        if @user.valid?
            @user.save
            render('users/show')
        else
            render json: :errors
        end
    end

    def update
        @user = User.find(params[:id])
        @user.update(user_params)
        render('users/show')
    end


    private

    def user_params
        params.require(:user).permit(:name, :job, :pay)
    end
end
