class StaticPagesController < ApplicationController
skip_before_action :require_login
    def home
    # トップページのコード
  end

  def contact
    @contact = Contact.new
  end

  def privacy_policy
    # プライバシーポリシーページのコード
  end

  def terms
  end
end

