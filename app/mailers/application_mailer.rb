class ApplicationMailer < ActionMailer::Base
  default from: "no-reply@atticus.com"
  layout 'mailer'
end
