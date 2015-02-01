class HomeController < ApplicationController
  include ThoughtsHelper
  def index
    if (!user_signed_in?)
      redirect_to new_user_session_path
    end
    @thought ||= Thought.new
    @allThought = Thought.where(user_id: current_user.id)

    @allTags = getUserTags! current_user.id
  end
end
