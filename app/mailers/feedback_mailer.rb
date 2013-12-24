class FeedbackMailer < ActionMailer::Base
  default :from => Settings.admin_email.dup

  def send_report(email, story = nil, type, msg)
    @story = story
    @type = type
    @msg = msg
    if story.nil?
      mail(:to => email, :subject => "[#{type}]")
    else
      mail(:to => email, :subject => "[故事資訊回報]#{story}")
    end
  end
end