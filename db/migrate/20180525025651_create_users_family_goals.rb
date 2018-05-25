class CreateUsersFamilyGoals < ActiveRecord::Migration[5.0]
  def change
    create_table :users_family_goals do |t|
      t.references :user, foreign_key: true
      t.references :family_goal, foreign_key: true

      t.timestamps
    end
  end
end
