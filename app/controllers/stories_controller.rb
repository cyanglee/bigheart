class StoriesController < ApplicationController
  before_action :check_user, only: [:edit, :destroy]

  def index
    @stories = Story.all
    #binding.pry
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    story_info = params[:story]
    @story = Story.where(story_name: story_info["story_name"]).first_or_create! do |s|
      s.appear_time_from = story_info["appear_time_from"]
      s.appear_time_to = story_info["appear_time_to"]
      s.appear_day = story_info["appear_day"]
      s.appear_location = story_info["appear_location"]
      s.story_details = story_info["story_details"]
      s.user_id = current_user.id
    end

    if @story.save
      redirect_to stories_path, notice: 'Story successfully created.'
    else
      render action: 'new'
    end
  end

  def edit
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(story_params)
      redirect_to stories_path, notice: 'Story updated.'
    else
      render action: 'edit'
    end
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy

    redirect_to stories_path
  end

private
  def story_params
    params.require(:story).permit(:appear_day, :appear_time_from, :appear_time_to, :appear_location, :story_details, :story_name)
  end

  def check_user
    story = Story.find(params[:id])
    if story.user_id != current_user.id
      raise "you're not able to edit this story"
    end
  end
end
