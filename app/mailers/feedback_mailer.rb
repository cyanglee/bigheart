class FeedbackMailer < ActionMailer::Base
  default :from => Settings.admin_email.dup

  def feedback(email, story, reason, suggest)
    @story = story
    @reason = reason
    @suggest = suggest
    mail(:to => email, :subject => "[故事資訊回報]#{story}")
  end
end
