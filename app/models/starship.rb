class Starship < ApplicationRecord
  has_many :crew_members,inverse_of: :starship
      accepts_nested_attributes_for :crew_members,
      reject_if: lambda {|attributes| attributes["name"].blank?},
      allow_destroy: true

  has_many :holodeck_programs,inverse_of: :starship
  accepts_nested_attributes_for :holodeck_programs,
      reject_if: lambda {|attributes| attributes["title"].blank?}
  validates_presence_of :name
end
