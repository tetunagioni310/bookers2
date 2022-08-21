class Users::RegistrationsController < Devise::RegistrationsController
  
  
  
  # protectedは呼び出された他のコントローラーからでも参照できる
  protected
  # パスワードなしでアップデートするメソッド
  def update_resource(resource, params)
    resource.update_without_password(params)
  end

  # 必須ではないがupdate後にtop画面にリダイレクトするメソッド
  def after_update_path_for(_resource)
    user_path(current_user.id)
  end

  # 下記のメソッドではdevise_parameter_sanitizer.permitメソッドを使うことでユーザー登録（sign_up）の際に、ユーザー名（name）のデータ操作を許可しています
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name])

    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :introduction, %i(profile_image)])
  end
end