class StoriesController < ApplicationController
  def index
    @stories = Story.all
  end

  def show
    @story = Story.find(params[:id])
  end

  def new
    @story = Story.new
  end

  def create
    story_info = params[:story]
    binding.pry
    @story = Story.where(story_name: story_info["story_name"]).first_or_create! do |s|
      s.appear_time = story_info["am_or_pm"] + story_info["appear_time"]
      s.appear_day = story_info["appear_day"]
      s.appear_location = story_info["appear_location"]
      s.story = story_info["story"]
    end

    if @story.save
      redirect_to stories_path, notice: 'Story successfully created.'
    else
      render action: 'new'
    end
  end

  def story_params
    params.permit(:appear_day, :appear_time, :appear_location, :story)
  end
end
