class HomeController < ApplicationController
  include ThoughtsHelper

  def index
    if (!user_signed_in?)
      redirect_to new_user_session_path
    end
    @thought ||= Thought.new
    @allThought = Thought.where(user_id: current_user.id).order("updated_at DESC")

    @allTags = getUserTags! current_user.id
  end

  def search
    if (!user_signed_in?)
      redirect_to new_user_session_path
    end

    @thought ||= Thought.new

    tmp = HashTag.find_by(hash_tag: "#FUCK")
    @allThought = tmp.thoughts

    @allTags = getUserTags! current_user.id

    render 'index'
  end

end
