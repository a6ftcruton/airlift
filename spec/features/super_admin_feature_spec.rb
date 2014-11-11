require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

describe 'super admin user', type: :feature do
  before  do

  end

  xit "can see all users" do
    visit '/vendor_admin'
    click_on 'Create New User or Administrator'
    expect(current_path).to eq new_vendor_admin_user_path
    expect(page).to have_content("Create A New User or Administrator")
  end

end
