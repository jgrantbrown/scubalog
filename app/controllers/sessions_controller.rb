class SessionsController < ApplicationController

  def new
    @account= Account.new
  end

  def create
    if account = Account.authenticate(account_params)
      session[:account_id]= account.id
      redirect_to diver_path
    else
      flash[:error] = "Bad username or password"
      redirect_to new_session_path
    end
  end

  private

  def account_params
    params.require(:account).permit(:username, :password)
  end

end
