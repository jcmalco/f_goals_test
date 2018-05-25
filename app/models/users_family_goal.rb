class UsersFamilyGoal < ActiveRecord::Base
  belongs_to :user
  belongs_to :family_goal
end
