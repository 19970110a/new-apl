class StaticPagesController < ApplicationController
skip_before_action :require_login
    def home
    # トップページのコード
  end

  def contact
    # お問い合わせページのコード
  end

  def privacy_policy
    # プライバシーポリシーページのコード
  end
end

