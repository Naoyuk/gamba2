module NavigationHelper
  def account_links_partial_path
    if logged_in?
      'layouts/navigation/account_elements/signed_in_links'
    else
      'layouts/navigation/account_elements/non_signed_in_links'
    end
  end
end
