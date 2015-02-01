class HomeController < ApplicationController

  def index
    if (!user_signed_in?)
      redirect_to new_user_session_path
    end
    @thought ||= Thought.new
    @allThought = Thought.where(user_id: current_user.id)

  end
end
