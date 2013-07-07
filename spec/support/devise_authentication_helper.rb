module DeviseAuthenticationHelper
  def account_sign_in(account = nil)
    @request.env["devise.mapping"] = Devise.mappings[:account]
    if account
      @account = account
    else
      @account = account || Fabricate(:account)
    end
    sign_in @account
  end
end
