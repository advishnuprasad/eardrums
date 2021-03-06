require 'spec_helper'

describe "Session" do
  before :each do
    @student = FactoryGirl.create(:student)
  end
    
  it "should have the content 'Login'" do
    visit '/users/sign_in'
    expect(page).to have_content 'Login'
  end
  
  it "should sign in user" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_login', with: @student.email
      fill_in 'user_password', with: @student.password
    end
    click_button "Login"
    expect(page).to have_content 'Signed in successfully'
  end
  
  it "should not sign in user when password is not given" do
    visit '/users/sign_in'
    within("#new_user") do
      fill_in 'user_login', with: 'subhash.bhushan@gmail.com'
    end
    click_button "Login"
    expect(page).to have_content "Invalid email/username or password"
  end
  
  it "should sign in user with Twitter" do
    pending
    visit '/users/sign_in'
    expect(page).to have_content "Twitter"
    find(:xpath, "//a/img[@alt='Twitter']/..").click
    expect(page).to have_content "Signed in successfully"
  end
end