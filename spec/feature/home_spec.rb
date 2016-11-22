require 'rails_helper'

feature "visiting homepage" do
  scenario "the visitor sees welcome text" do
    visit root_path
    expect(page).to have_text("Welcome to RubyThrusday")
  end
end
