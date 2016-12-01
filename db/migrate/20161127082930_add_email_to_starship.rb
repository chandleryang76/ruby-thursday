class AddEmailToStarship < ActiveRecord::Migration[5.0]
  def change
    add_column :starships, :email, :string
  end
end
