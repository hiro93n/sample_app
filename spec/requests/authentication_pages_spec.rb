require 'spec_helper'

=begin
describe "AuthenticationPages" do
  describe "GET /authentication_pages" do
    it "works! (now write some real specs)" do
      # Run the generator again with the --webrat flag if you want to use webrat methods/matchers
      get authentication_pages_index_path
      response.status.should be(200)
    end
  end
end
=end

describe "Autgentication" do
	subject { page }

	describe "signin page" do
		before{ visit signin_path }

		it{should have_content('Sign in')}
		it{should have_title('Sign in')}

　　describe "followed by signout" do
        before { click_link "Sign out" }
        it { should have_link('Sign in') }
  　end

    describe "with valid information" do
      let(:user) { FactoryGirl.create(:user) }
      before { sign_in user }

      it { should have_title(user.name) }
      it { should have_link('Profile',     href: user_path(user)) }
      it { should have_link('Settings',    href: edit_user_path(user)) }
      it { should have_link('Sign out',    href: signout_path) }
      it { should_not have_link('Sign in', href: signin_path) }
    end

	end
end