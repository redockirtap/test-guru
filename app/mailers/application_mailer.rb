class ApplicationMailer < ActionMailer::Base
  default from: %("TestGuru" <noreply@guru.com>)
  layout 'mailer'
end
