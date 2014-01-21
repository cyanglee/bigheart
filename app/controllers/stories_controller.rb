class StoriesController < ApplicationController
  #before_action :show, :check_state
  before_filter :set_cache_buster, only: :index

  def index
    # TODO: change the hardcoded value to reference
      @stories = Story.where(state: Story::STATES.published)
      # get location latitude and longitude
      @details = {}

      @stories.each do |s|
        @details[s.story_name] = {}
        @details[s.story_name][:latitude] = []
        @details[s.story_name][:longitude] = []
        @details[s.story_name][:story_id] = s.id
        Story.parse_location_json(s.appear_location).each do |l, c|
          lat_n_lng = c.split(',')
          @details[s.story_name][:latitude] << lat_n_lng[0]
          @details[s.story_name][:longitude] << lat_n_lng[1]
        end
      end
  end

  def show
    story = Story.find(params[:id])

    # get location latitude and longitude
    @latitude = []
    @longitude = []

    Story.parse_location_json(story.appear_location).each do |l, c|
      lat_n_lng = c.split(',')
      @latitude << lat_n_lng[0]
      @longitude << lat_n_lng[1]
    end

    # set og tags for facebook like and share
    set_meta_tags og: {title: "#{story.story_name}", description: "#{story.story_details}", type: "article", url: "http://bigheart.tw/stories/#{story.id}", image: "#{story.image}"}
    set_meta_tags fb: {app_id: "250816725069932"}
    if story.state != Story::STATES.published
      # check admin role if story state isn't published
      if user_signed_in? && current_user.has_role?(:admin)
        @story = story
      else
        flash[:alert] = "這篇文章尚未通過審核!!"
        redirect_to root_path
      end
    else
      @story = story
    end
  end

  def new
    @story = Story.new
  end

  def create
    @story = Story.new(story_params)

    if @story.valid?
      #get story location coordinate
      @story.appear_location = Story.manage_coordinate(story_params[:city], story_params[:appear_location]).to_json
      #story.user_id = current_user.id
      @story.save
      redirect_to stories_path, notice: "故事將於審查後發佈."
    else
      flash.now.alert = "請檢查您所輸入的資訊是否有誤!!"
      render action: 'new'
    end
  end

  def edit
    authorize! :update, @story
    @story = Story.find(params[:id])
    location = []
    Story.parse_location_json(@story.appear_location).keys.each do |l|
      location << l
    end
    @location = location.join(',')
  end

  def update
    @story = Story.find(params[:id])

    if @story.update_attributes(story_params)
      @story[:appear_location] = Story.manage_coordinate(story_params[:city], story_params[:appear_location]).to_json
      @story.published!
      redirect_to manage_stories_path, notice: '成功編輯故事.'
    else
      render action: 'edit'
    end
  end

  def manage_stories
    authorize! :manage_stories, @stories
    @stories = Story.all
  end

  def update_state
    authorize! :manage_stories, Story
    story = Story.find(params[:id])
    story.send(params[:story][:state])
    #if params[:story][:state].to_sym == :published
    #  story.published!
    #elsif params[:story][:state] == 'rejected'
    #  story.rejected!
    #elsif params[:story][:state] == 'pending'
    #  story.pending!
    #end
    redirect_to manage_stories_path, notice: "已變更狀態為#{Story::TRANS_STATES[story.state]}"
  end

  def destroy
    authorize! :manage_stories, Story
    story = Story.find(params[:id])
    story.destroy

    redirect_to manage_stories_path
  end

private
  def story_params
    params.require(:story).permit(:story_name, :appear_time_from, :appear_time_to, :city, :appear_location, :info_from, :story_details, :image, :contact_email, :appear_day => [])
  end

  def set_cache_buster
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
  end
end


