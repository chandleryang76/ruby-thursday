class CrewMember < ApplicationRecord
  belongs_to  :starship,inverse_of: :crew_members
end
