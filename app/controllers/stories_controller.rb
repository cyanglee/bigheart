class StoriesController < ApplicationController
  def index
    # TODO: change the hardcoded value to reference
      @stories = Story.where(state: Story::STATES.published)
  end

  def show
    @story = Story.find(params[:id])
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
    @story = Story.find(params[:id])
    authorize! :update, @story
  end

  def update
    @story = Story.find(params[:id])
    if @story.update_attributes(story_params)
      @story.pending!
      redirect_to stories_path, notice: '成功編輯故事.'
    else
      render action: 'edit'
    end
  end

  def manage_stories
    @stories = Story.all
    authorize! :manage_stories, Story
  end

  def update_state
    story = Story.find(params[:id])
    story.send(params[:story][:state])
    #if params[:story][:state].to_sym == :published
    #  story.published!
    #elsif params[:story][:state] == 'rejected'
    #  story.rejected!
    #elsif params[:story][:state] == 'pending'
    #  story.pending!
    #end
    redirect_to manage_stories_path
  end

  def feedback
    @story = Story.find(params[:id])
    User.all.each do |user|
      if user.has_role? :admin
        FeedbackMailer.feedback(user.email, @story.story_name, params[:story][:report_reason], params[:story][:report_text]).deliver
      end
      flash[:notice] = "已提交回報資訊予管理員"
    end

    redirect_to story_path(params[:id])
  end

  def destroy
    story = Story.find(params[:id])
    story.destroy

    redirect_to manage_stories_path
  end

private
  def story_params
    params.require(:story).permit(:story_name, :appear_day, :appear_time_from, :appear_time_to, :city, :appear_location, :info_from, :story_details, :image, :contact_email)
  end
end
