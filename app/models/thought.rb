class Thought < ActiveRecord::Base
  belongs_to :user
  has_many :thought_tags
  has_many :hash_tags, through: :thought_tags
end
