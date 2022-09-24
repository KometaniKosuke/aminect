class Tag < ApplicationRecord
  has_ancestry
  
  has_many :user_tags
  has_many :users, through: :user_tags
end
