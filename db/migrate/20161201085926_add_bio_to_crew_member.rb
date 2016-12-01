class AddBioToCrewMember < ActiveRecord::Migration[5.0]
  def change
    add_column :crew_members, :bio, :text
  end
end
