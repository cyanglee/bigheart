#admin info
ENV['admin_name'] = 'marcus'
ENV['admin_email'] = 'bigheart.marcus@gmail.com'
ENV['admin_password'] = 'marcus0972'

# admin email
ENV['mail_ad'] = 'bigheart.marcus@gmail.com'
ENV['mail_pw'] = 'bigheartmarcuskuan'

# facebook
if Rails.env.test? && Rails.env.development?
  ENV['app_id'] = '472511292859137'
  ENV['secret'] = 'bb192c42c1120a7df8190abc62fb5b1a'
end