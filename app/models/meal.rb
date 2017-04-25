class Meal < ActiveRecord::Base
  has_many :foods
  belongs_to :user
end
