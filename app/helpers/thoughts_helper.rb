module ThoughtsHelper

  def TagExist? ( tags )
    tmp = HashTag.find_by(hash_tag: tags)
    return (!tmp.blank?)
  end

  def getUserTags! (user_id)
    thought = Thought.where(user_id: user_id)
    allTag = Set.new
    thought.each do |t|
      t.hash_tags.each do |tag|
        allTag.add(tag.hash_tag)
      end
    end
    return allTag.to_a
  end

end
