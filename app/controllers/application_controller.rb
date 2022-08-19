class ApplicationController < ActionController::Base
  # devise利用の機能（ユーザー登録、ログイン認証など）が使われる前に下記が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end

  # protectedは呼び出された他のコントローラーからでも参照できる
  protected

  # 下記のメソッドではdevise_parameter_sanitizer.permitメソッドを使うことでユーザー登録（sign_up）の際に、ユーザー名（name）のデータ操作を許可しています
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])
  end
end
