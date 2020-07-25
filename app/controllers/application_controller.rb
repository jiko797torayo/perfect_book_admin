class ApplicationController < ActionController::Base
  before_action :detect_mobile_variant
  # before_action :require_login

  # def require_login
  #   # ログインを確認し、非ログイン時にリダイレクトする処理
  # end
  
  private

  def detect_mobile_variant
    request.variant = :mobile if request.user_agent =~ /iPhone/
  end
end
