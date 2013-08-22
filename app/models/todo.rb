class Todo < ActiveRecord::Base
  belongs_to :user
  validates :todo, presence: true
  validates :todo, length: { minimum: 1 }
end
