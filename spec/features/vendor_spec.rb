require 'capybara/poltergeist'
Capybara.javascript_driver = :poltergeist
Capybara.default_wait_time = 5

describe 'vendor', type: :feature do
  before do
    @vendor = create(:vendor)
    @item = create(:item, vendor: @vendor, title: 'band aids')
  end

  it 'views all vendor pages' do
    visit root_path
    click_on('Browse By Vendor')
    expect(current_path).to eq vendors_path
    expect(page).to have_link('first store')
  end

  it 'views a single vendor page' do
    visit vendors_path
    click_on('first store')
    expect(current_path).to eq vendor_path(@vendor.id)
    expect(page).to have_link('band aids')
    expect(page).to_not have_content('error')
  end
end
