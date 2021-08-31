class UsersController < ApplicationController
  skip_before_action :verify_authenticity_token, only: :new_session

  def login
    @user = User.new
  end

  def new_session
    @user = User.find_by_email(user_params[:email])
    if @user.nil?
      redirect_to login_path, notice: 'The user does not exist'
    elsif @user.valid_password?(user_params[:password])
      sign_in(:user, @user)
      redirect_to :root, notice: 'Session successfully started'
    else
      redirect_to login_path, alert: 'Incorrect password or email'
    end
  end

  def logout
    sign_out
    redirect_to :root, notice: 'You have successfully closed the session'
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end
end
