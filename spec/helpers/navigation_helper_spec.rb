require 'rails_helper'

RSpec.describe NavigationHelper, :type => :helper do

  context 'signed in user' do
    before(:each) { allow(controller).to receive(:logged_in?).and_return(true) }

    context '#account_links_partial_path' do
      it "return signed_in_links_partial_path" do
        expect(helper.account_links_partial_path).to (
          eq 'layouts/navigation/account_elements/signed_in_links'
        )
      end
    end
  end
end
