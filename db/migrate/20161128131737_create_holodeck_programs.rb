class CreateHolodeckPrograms < ActiveRecord::Migration[5.0]
  def change
    create_table :holodeck_programs do |t|
      t.string :title
      t.integer :starship_id
      t.integer :crew_member_id

      t.timestamps
    end
  end
end
