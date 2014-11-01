require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

describe 'authenticated user', type: :feature do
  include Capybara::DSL

	before do
    user = create(:user, id: 1, first_name: 'joe', email: 'abc@example.com', password: 'asdf', password_confirmation: 'asdf')
    create(:vendor)
    shelter_category = create(:category, title: 'Shelter')
    create(:item, title: 'Second Food', categories: [shelter_category])
    create(:item, title: "first thing", description: "good", vendor_id: 1, categories: [shelter_category])
    create(:item, title: "second thing", description: "great", vendor_id: 2, categories: "shelter")
    visit '/'
    fill_in 'email', with: "#{user.email}"
    fill_in 'password', with: "#{user.password}"
    click_on 'login'
	end

  context 'adds items from multiple vendors' do
    before do
      visit items_path
      first('#add_to_cart').click
    end

    it 'can add items from multiplie vendors' do
      save_and_open_page
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
