# Base mailer class
class ApplicationMailer < ActionMailer::Base
    default from: 'mailer@lilmonkey.ru'
    layout 'mailer'
end
