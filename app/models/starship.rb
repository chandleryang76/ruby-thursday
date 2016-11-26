class Starship < ApplicationRecord
  has_many :crew_members,inverse_of: :starship,dependent: :destroy
      accepts_nested_attributes_for :crew_members,
      reject_if: lambda {|attributes| attributes["name"].blank?}
end
