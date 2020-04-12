class Task < ApplicationRecord
  belongs_to :user
  
  validates :content, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { minimum: 5 }
  
  
end
