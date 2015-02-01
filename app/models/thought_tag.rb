class ThoughtTag < ActiveRecord::Base
  belongs_to :thought
  belongs_to :hash_tag
end
