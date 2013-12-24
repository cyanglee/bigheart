class StoriesController < ApplicationController
  #before_action :show, :check_state

  def index
    # TODO: change the hardcoded value to reference
      @stories = Story.where(state: Story::STATES.published)
  end

  def show
    story = Story.where(id: params[:id], state: 2).first
    if story.nil?
      flash[:alert] = "這篇文章尚未通過審核!!"
      redirect_to root_path
    else
      @story = story
    end
  end

  def new
    @story = Story.new
  end

  def create
    story = Story.new(story_params)
    if story.valid?
      #story.user_id = current_user.id
      story.save
      redirect_to stories_path, notice: '故事將於審查後發佈.'
    else
      render action: 'new'
    end
  end

  def edit
    authorize! :update, @story
    @story = Story.find(params[:id])
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
      @story.published!
      redirect_to stories_path, notice: '成功編輯故事.'
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
    params.require(:story).permit(:story_name, :appear_day, :appear_time_from, :appear_time_to, :city, :appear_location, :info_from, :story_details, :image, :contact_email)
  end
end
