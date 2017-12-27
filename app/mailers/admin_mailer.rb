# Admin Mailer
class AdminMailer < ApplicationMailer
    def admin_email(args = {})
        @author = args[:author]
        @contact = args[:contact]
        @body = args[:body]
        mail(to: ENV['ADMIN_EMAIL'], subject: 'Message from LilMonkey')
    end

    def yandex_money_email
        mail(to: ENV['ADMIN_EMAIL'], subject: 'Received Money at Yandex')
    end
end
