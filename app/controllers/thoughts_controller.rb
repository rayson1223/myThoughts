class ThoughtsController < ApplicationController
  before_action :set_thought, only: [:show, :edit, :update, :destroy]
  include ThoughtsHelper
  # GET /thoughts
  # GET /thoughts.json
  def index
    @thoughts = Thought.all
  end

  # GET /thoughts/1
  # GET /thoughts/1.json
  def show
  end

  # GET /thoughts/new
  def new
    @thought = Thought.new
  end

  # GET /thoughts/1/edit
  def edit
  end

  # POST /thoughts
  # POST /thoughts.json
  def create
    @thought = Thought.new(thought_params)
    @thought.user_id = current_user.id
    temp = @thought.content
    s = temp.split(" ")
    allTag = Set.new
    s.each do |tag|
      if tag.start_with?('#')
        allTag.add(tag)
      end
    end

    respond_to do |format|
      if @thought.save
        allTag = allTag.to_a
        allTag.each do |tag|
          if (!TagExist?(tag))
            @thought.hash_tags.create(hash_tag: tag)
          end
        end
        flash.now[:success] = 'Your Thought was successfully created.'
        format.html { redirect_to root_path, notice: 'Your Thought was successfully created.'}
        format.json { render :show, status: :created, location: @thought }
      else
        format.html { render :new }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /thoughts/1
  # PATCH/PUT /thoughts/1.json
  def update
    respond_to do |format|
      if @thought.update(thought_params)
        format.html { redirect_to @thought, notice: 'Thought was successfully updated.' }
        format.json { render :show, status: :ok, location: @thought }
      else
        format.html { render :edit }
        format.json { render json: @thought.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /thoughts/1
  # DELETE /thoughts/1.json
  def destroy
    @thought.destroy
    respond_to do |format|
      format.html { redirect_to thoughts_url, notice: 'Thought was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_thought
      @thought = Thought.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def thought_params
      params.require(:thought).permit(:content)
    end
end
