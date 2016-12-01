require 'rails_helper'

feature "Add crew members" do

  scenario "visitor assings new crew member to starship" do
    Given "visitor views new crew member form"
    When  "visitor enters crew member info assigning to existing starship"
    Then "visitor views updated starship"
  end


  scenario "visitor creates crew member and starship" do
    Given "visitor views new crew member form"
    When  "visitor enters crew member and new starship info"
    Then "visitor views updated starship"
  end


  scenario "visitor creates crew member and starship and holdodeck program" do
    Given "visitor views new crew member form"
    When  "visitor enters all info"
    Then "visitor views new startship with holodeck program"
  end


  let!(:starship) {FactoryGirl.create(:starship)}

  def visitor_views_new_crew_member_form

    visit starships_path
    click_link "Create New Crew Member"
    expect(page).to have_content("New Crew Member")
  end

  def visitor_enters_crew_member_info_assigning_to_existing_starship
    fill_in_crew_member_info
    select "Enterprise", from: "crew_member[starship_id]"
    click_button "Create Crew Member"
  end

  def visitor_views_updated_starship
    expect(page).to have_content("Reginal Barclay")
  end

  def visitor_views_new_starship
    expect(page).to have_content("Reginal Barclay")
    expect(page).to have_content("Voyager")
  end

  def visitor_enters_crew_member_and_new_starship_info
    fill_in_crew_member_info
    fill_in_starship_info
    click_button "Create Crew Member"
  end

  def visitor_enters_all_info
    fill_in_crew_member_info
    fill_in_starship_info
    fill_in_holodeck_program_info
    click_button "Create Crew Member"
  end

  def visitor_views_new_startship_with_holodeck_program
    visitor_views_new_starship
    expect(page).to have_css("#cm-hp",text: "Hollow Pursuits")
    expect(page).to have_css("#hp",text: "Hollow Pursuits")
  end

  def fill_in_crew_member_info
    fill_in("crew_member[name]", with: "Reginal Barclay")
    select "Engineering", from: "crew_member[division]"
  end

  def fill_in_starship_info
    fill_in("crew_member[starship_attributes][name]", with: "Voyager")
  end

  def fill_in_holodeck_program_info
    fill_in("crew_member[starship_attributes][holodeck_programs_attributes][0][title]",
    with: "Hollow Pursuits")
  end

end





