class ThoughtTag < ActiveRecord::Base
  belongs_to :thought
  belongs_to :hash_tag

  validates :thought_id, presence: true
  validates :hash_tag_id, presence: true
end
