# Admin Mailer
class AdminMailer < ApplicationMailer
    def admin_email(args = {})
        @author = args[:author]
        @body = args[:body]
        mail(to: ENV['ADMIN_EMAIL'], subject: 'Message from LilMonkey')
    end
end