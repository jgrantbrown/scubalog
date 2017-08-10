class RegistrationsController < ApplicationController

  def new
    @account = Account.new
  end

  def create
      account = Account.new(account_params)
      @diver=Diver.create
      account.diver_id = @diver.id
      @diver.first_name= account.first_name
      @diver.last_name= account.last_name
      @diver.email= account.email
      account.save
      @diver.save
    if
      session[:account_id]=account.id

      redirect_to diver_path(@diver.id)
    else
      flash[:error] = "username or email is already taken"
      redirect_to new_registration_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:username, :password, :first_name, :last_name, :email)
  end

end
