class FeedbackMailer < ActionMailer::Base
  default :from => Settings.admin_email.dup

  def report(email, story, reason, suggest)
    @story = story
    @reason = reason
    @suggest = suggest
    mail(:to => email, :subject => "[故事資訊回報]#{story}")
  end

  def feedback(email, feedback_type, feedback_msg)
    @type = feedback_type
    @msg = feedback_msg
    mail(:to => email, :subject => "[#{feedback_type}]")
  end
end
