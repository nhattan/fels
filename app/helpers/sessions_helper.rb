module SessionsHelper

  def sign_in(user)
    remember_token = User.new_remember_token
    cookies.permanent[:remember_token] = remember_token
    user.need_validate = false
    user.update_attributes(remember_token: User.encrypt(remember_token))
    user.need_validate = true
    self.current_user = user
  end

  def signed_in?
    !current_user.nil?
  end

  def current_user=(user)
    @current_user = user
  end

  def current_user
    remember_token = User.encrypt(cookies[:remember_token])
    @current_user ||= User.find_by remember_token: remember_token
  end

  def current_user?(user)
    user == current_user
  end

  def sign_out
    token = User.encrypt(User.new_remember_token)
    current_user.need_validate = false
    current_user.update_attributes(remember_token: token)
    current_user.need_validate = true
    cookies.delete(:remember_token)
    self.current_user = nil
  end

  def redirect_back_or(default)
    redirect_to(session[:return_to] || default)
    session.delete(:return_to)
  end

  def store_location
    session[:return_to] = request.url if request.get?
  end
end
