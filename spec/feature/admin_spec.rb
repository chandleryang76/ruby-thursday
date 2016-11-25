require 'rails_helper'

feature "Admin" do
  scenario "admin sees hacker after login" do
    Given "admin is signed in"
    When "admin veiws all hackers"
    Then "admin sees the first hacker"
  end

  let!(:admin) { FactoryGirl.create(:admin)}
  let!(:hacker) {FactoryGirl.create(:hacker)}

  def admin_is_signed_in
    visit root_path
    click_link "Admin Sign in"
    fill_in "admin[email]", with: admin.email
    fill_in "admin[password]", with: admin.password
    click_button "Log in"
  end

  def admin_veiws_all_hackers
    click_link "View Hacker List"
    expect(page).to have_content("Hacker List")
  end

  def admin_sees_the_first_hacker
    expect(page).to have_content(hacker.email)
  end
end