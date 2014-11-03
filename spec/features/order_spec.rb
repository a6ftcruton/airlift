require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

describe 'authenticated user', type: :feature do
  include Capybara::DSL

	before do
      user = create(:user, id: 1, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
      small_plates_category = create(:category, title: 'Small Plates')
      first_vendor = create(:vendor, name: "great place")
      second_vendor = create(:vendor, name: "mediocre place")
      item = create(:item, title: 'Second Food', categories: [small_plates_category], vendor_id: 1, active: true)
      next_item = create(:item, title: 'Another Food', categories: [small_plates_category], vendor_id: 2, active: true)
      @order = create(:order, user_id: 1, items: [item, next_item] )
      visit '/'
      fill_in 'email', with: "#{user.email}"
      fill_in 'password', with: "#{user.password}"
      click_on 'login'
      click_on 'My Profile'
      click_on 'Your Orders'
    end

  context 'adds items from multiple vendors' do
    before do
      visit items_path
      first('#add_to_cart').click
    end

    xit 'can add items from multiplie vendors' do
      expect(page).to have_content 'Item added to your cart!'
      visit vendor_path(2)
      first('#add_to_cart').click
      visit cart_edit_path
      within('#table') do
        expect(page).to have_content 'Item' 
        expect(page).to have_content 'Purchased from' 
        expect(page).to have_content 'first vendor here' 
        expect(page).to have_content 'second vendor here' 
      end 
    end
  
  end

  
end
