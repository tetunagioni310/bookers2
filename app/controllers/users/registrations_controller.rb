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

end