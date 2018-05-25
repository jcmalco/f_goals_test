class User < ActiveRecord::Base
  has_many :users_family_goals
  has_many :family_goals, through: :users_family_goals
end
