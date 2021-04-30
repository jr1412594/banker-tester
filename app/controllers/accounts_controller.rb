class AccountsController < ApplicationController
    def index
        @accounts = Account.all 
    end

    def show
        @account = Account.find(params[:id])
    end

    def create
        @account = Account.new(account_params)
        if @account.valid?
            @account.save
            render('accounts/show')
        else
            render json: :errors
        end
    end

    def update
        
    end

    private

    def account_params
        params.require(:account).permit(:user_id, :bank_id)
    end
end
