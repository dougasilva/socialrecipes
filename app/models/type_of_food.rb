class TypeOfFood < ActiveRecord::Base
  validates :name, presence: true
  has_many :recipe
end
