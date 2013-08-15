class Todo < ActiveRecord::Base
  validates :todo, presence: true
  validates :todo, length: { minimum: 1 }
end
