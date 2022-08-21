class ApplicationController < ActionController::Base
  # ログイン認証が成功していないと、トップページ以外の画面（ログインと新規登録は除く）はアクセスできないbeforeアクション
  before_action :authenticate_user!, except: [:top]

  # devise利用の機能（ユーザー登録、ログイン認証など）が使われる前に下記が実行される
  before_action :configure_permitted_parameters, if: :devise_controller?

  def after_sign_in_path_for(resource)
    user_path(current_user.id)
  end

  def after_sign_out_path_for(resource)
    root_path
  end
end