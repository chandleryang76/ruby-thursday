require 'rails_helper'



feature "Starship with Crew Members" do
  scenario "visiter can create starship with crew members" do
    Given "visiter can view new startship form"
    When "visiter enters information for startship and crew members"
    Then "visiter can see starship listing"
    Then "visiter receives starship email"
  end

  def visiter_can_view_new_startship_form
    visit new_starship_path
    expect(page).to have_content("New Starship")
  end

  def visiter_enters_information_for_startship_and_crew_members
    enter_starship_info
    enter_crew_members_info
    click_button "Create Starship"
  end

  def visiter_can_see_starship_listing
    expect(page).to have_content("USS Enberprise (NCC-1701-A)")
    expect(page).to have_content("James T. Kirk")
  end

  def visiter_receives_starship_email
    open_email('chandleryang76@gmail.com')
    expect(current_email.to).to eq ["chandleryang76@gmail.com"]
    expect(current_email.subject).to eq 'Starship Created'
    expect(current_email).to have_content 'Congrate!'
    clear_emails
  end

  def enter_starship_info
    fill_in("starship[name]", with: "USS Enberprise (NCC-1701-A)")
    fill_in("starship[email]", with: "chandleryang76@gmail.com")
  end


  def enter_crew_members_info
   # binding.pry
    fill_in("starship[crew_members_attributes][0][name]",
            with: "James T. Kirk")
    select('Command', :from=>"starship[crew_members_attributes][0][division]")

    fill_in("starship[crew_members_attributes][1][name]",
            with: "Spock")
    select('Command', :from=>"starship[crew_members_attributes][1][division]")

    fill_in("starship[crew_members_attributes][2][name]",
            with: "Leonard MaCoy")
    select('Command', :from=>"starship[crew_members_attributes][0][division]")
  end

end