class CreateFamilyGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :family_goals do |t|
      t.string :name
      t.string :code
      t.string :cargo
      t.string :area
      t.string :mundo

      t.timestamps
    end
  end
end
