class ApplicationController < ActionController::Base
  before_action :require_login

  def require_login
    # ログインを確認し、非ログイン時にリダイレクトする処理
  end
end
