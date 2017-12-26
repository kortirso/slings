# Admin Mailer Preview
class AdminMailerPreview < ActionMailer::Preview
    def sample_admin_preview
        AdminMailer.admin_email(author: 'Author', contact: 'Contact Email', body: 'Test text')
    end
end
