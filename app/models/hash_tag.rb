class HashTag < ActiveRecord::Base
  has_many :thought_tags
  has_many :thoughts, through: :thought_tags
end
