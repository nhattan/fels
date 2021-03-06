class UsersController < ApplicationController
  before_action :sign_in_user, only: [:edit, :update]
  before_action :correct_user, only: [:edit, :update]
  before_action :admin_user, only: [:destroy]

  def index
    @users = User.paginate page: params[:page]
  end

  def show
    @user = User.find params[:id]
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new user_params
    if @user.save
      sign_in @user
      flash[:success] = "Welcome to FELS"
      redirect_to @user
    else
      render 'new'
    end
  end

  def edit
    @user = User.find params[:id]
  end

  def update
    if @user.update_attributes(user_params)
      flash[:success] = "Updated Successfull"
      redirect_to @user
    else
      render 'edit'
    end
  end

  def destroy
    @user = User.find params[:id]
    @user.destroy
    flash[:success] = "User deleted"
    redirect_to users_url
  end

  private

    def user_params
      params.require(:user).permit(:name, :email, :password,
        :password_confirmation, :role)
    end

    def sign_in_user
      unless signed_in?
        store_location
        redirect_to signin_url, notice: "Please sign in"
      end
    end

    def correct_user
      @user = User.find params[:id]
      redirect_to(root_url) unless current_user?(@user)
    end

    def admin_user
      redirect_to(root_url) unless current_user.role == 3
    end
end
