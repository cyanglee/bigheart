class SendMailController < ApplicationController
  def report
    User.all.select { |u| u.has_role? :admin }.each do |user|
      Thread.new do
        FeedbackMailer.send_report(user.email, params[:report][:story_name], params[:report][:type], params[:report][:report_msg]).deliver
        flash[:notice] = "已將回報資訊提交予管理員"
      end
    end
    #end
    redirect_to root_path
  end
end