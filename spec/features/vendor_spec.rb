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
    find('.dropdown-toggle').click
    within('.dropdown-menu') do
      find('li:nth-child(1) > a').click
    end
    expect(current_path).to eq vendor_path(@vendor)
    expect(page).to have_link('first store')
  end

  it 'views a single vendor page' do
    visit vendors_path
    within('.vendors-list') do
      click_on('first store')
    end
    expect(current_path).to eq vendor_path(@vendor.id)
    expect(page).to have_link('band aids')
    expect(page).to_not have_content('error')
  end
end
