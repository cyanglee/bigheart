class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = "你沒有瀏覽此頁面的權限!"
    redirect_to root_path
  end

  def after_sign_in_path_for(resource)
    stories_path
  end

  def feedback
    User.all.each do |user|
      if user.has_role? :admin
        FeedbackMailer.feedback(user.email, params[:feedback][:type], params[:feedback][:feedback_msg]).deliver
      end
      flash[:notice] = "已將建議或錯誤資訊提交予管理員"
    end

    redirect_to story_path(params[:id])
  end

end
