class WhinerMailer < ApplicationMailer
    default from: 'mailer@querulous.com'
 
    def welcome_email
        
      @whiner = params[:whiner]
      @url  = 'http://www.querulous.com/login'

      mail(
        to: @whiner.email,
        from: 'mailer@querulous.com',
        subject: 'Welcome, new Whiner, to Querulous!'
      )
    end
end
