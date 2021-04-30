class BanksController < ApplicationController
    def index
        @banks = Bank.all 
    end

    def show
        @bank = Bank.find(params[:id])
    end

    def create
        @bank = Bank.new(bank_params)
        if @bank.valid?
            @bank.save
            render('banks/show')
        else
            render json: :errors
        end
    end

    def update
        @bank = Bank.find(params[:id])
        @bank.update(bank_params)
        render('banks/show')
    end

    private

    def bank_params
        params.require(:bank).permit(:name, :location)
    end
end
