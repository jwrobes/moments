require 'spec_helper'

describe 'the registration process', :type => :feature do
	let(:user) {FactoryGirl.create :user}
	it "goes to registration page" do
		visit root_path
		click_on 'Sign up'
		expect(page).to have_content("Email")
	end

	it "can register with valid email, password and phone" do
		visit '/users/sign_up'
		fill_in 'user[email]', with: "jwrobes@gmail.com"
		fill_in 'user[phone_number]', with: "5103015114"
		fill_in 'user[password]', with: "password"
		fill_in 'user[password_confirmation]', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("Logout")
	end

	it "can not register with invalid phone number" do
		visit '/users/sign_up'
		fill_in 'user[email]', with: "jwrobes@gmail.com"
		fill_in 'user[phone_number]', with: "510315114"
		fill_in 'user[password]', with: "password"
		fill_in 'user[password_confirmation]', with: "password"
		click_on 'Sign up'
		expect(page).to have_content("Phone number is an invalid number")
	end
end

describe 'the sign in process', :type => :feature do
	context 'can login with valid email and password' do
		let!(:user) {FactoryGirl.create :user}
		it "can sign in" do
			visit root_path
			click_on 'Login'
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: user.password
			click_on "Sign in"
			expect(page).to have_content("Logout")
		end
	end

	context 'fails to login with valid email and password' do
	let!(:user) {FactoryGirl.create :user}
		it "can not sign in" do
			visit root_path
			click_on 'Login'
			fill_in 'user[email]', with: user.email
			fill_in 'user[password]', with: "password"
			click_on "Sign in"
			expect(page).to have_content("Invalid email or password")
		end
	end

end