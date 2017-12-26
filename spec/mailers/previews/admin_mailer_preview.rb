# Admin Mailer Preview
class AdminMailerPreview < ActionMailer::Preview
    def sample_admin_preview
        AdminMailer.admin_email(body: 'Test text')
    end
end
