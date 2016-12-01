module RubyThursday
  module Feautres
    module Starship
    def create_starship
      visit new_starship_path
      fill_in "starship[name]", with: "Enterprise"
      click_button "Create Starship"
    end

    def create_starship_with_crew_member(crew_name)
      visit new_starship_path
      fill_in "starship[name]", with: "Enterprise"
      fill_in "starship[crew_members_attributes][0][name]", with: crew_name
      select('Science', :from=>"starship[crew_members_attributes][0][division]")
      click_button "Create Starship"
    end
    end
  end
end


RSpec.configure do |config|
  config.include RubyThursday::Feautres::Starship, type: :feature
end