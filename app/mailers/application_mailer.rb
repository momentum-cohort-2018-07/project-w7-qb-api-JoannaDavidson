class ApplicationMailer < ActionMailer::Base
  default from: 'mailer@querulous.com'
  layout 'mailer'
end
