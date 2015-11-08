class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_filter :configuration_permitted_parameters, if: :devise_controller?

  # public / protected / private 不是關鍵字，是 Ruby 的方法

  # public: 方法的預設都是 public, 除了 initialize 方法是 private 且只能被 new 方法呼叫
  # private: 僅供類別內部使用，只能讓該類別或它的子類別的實體呼叫，被呼叫時，會自動以 self 的方式被呼叫，所以不能用 self.private_method 的方式呼叫
  # protected: 只能在類別裡面，供實體方法呼叫

  protected

  def configuration_permitted_parameters
    devise_parameter_sanitizer.for(:sign_up) {
      |u| u.permit(:name, :email, :password, :password_confirmation)
    }
  end
end
