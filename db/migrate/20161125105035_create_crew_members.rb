class CreateCrewMembers < ActiveRecord::Migration[5.0]
  def change
    create_table :crew_members do |t|
      t.string :name
      t.string :division
      t.integer :starship_id

      t.timestamps
    end
  end
end
