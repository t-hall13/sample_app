include ApplicationHelper

def full_title(page_title)
  base_title = "Ruby on Rails Tutorial Sample App"
  if page_title.empty?
    base_title
  else
    "#{base_title} | #{page_title}"
  end
end

def valid_signin(user)
	fill_in "Email", with: user.email
	fill_in "Password", with: user.password
	click_button "Sign in"	
end

def pre_populate
	fill_in "Name", with: "Example User"
	fill_in "Email", with: "user@example.com"
	fill_in "Password", with: "foobar"
	fill_in "Confirmation", with: "foobar"
	
end

def profile_page
	it { should have_title(user.name) }
	it { should have_link('Users', href: users_path) }
	it { should have_link('Profile', href: user_path(user)) }
	it { should have_link('Settings', href: edit_user_path(user)) }
    it { should have_link('Sign out', href: signout_path) }
	it { should_not have_link('Sign in', href: signin_path) }
	
end

def sign_in(user, options={})
	if options[:no_capybara]
		#Sign in when not using Capybara.
		remember_token = User.new_remember_token
		cookies[:remember_token] = remember_token
		user.update_attribute(:remember_token, User.digest(remember_token))
	else
		visit signin_path
		fill_in "Email",  with: user.email
		fill_in "Password",  with: user.password
		click_button "Sign in"
	end	
end

RSpec::Matchers.define :have_error_message do |message|
	match do |page|
		expect(page).to have_selector('div.alert.alert-error', text: message)
	end
end
#this helper method is no longer needed because of the call to spec/helpers/application_helper_spec.rb
# def full_title(page_title)
# 		base_title = "Ruby on Rails Tutorial Sample App"
# 		if page_title.empty?
# 			base_title
# 		else
# 			"#{base_title} | #{page_title}"
# 		end
# 	end