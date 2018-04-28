# Admin Mailer Preview
class AdminMailerPreview < ActionMailer::Preview
  def sample_admin_preview
    AdminMailer.admin_email(author: 'Author', contact: 'Contact Email', body: 'Test text')
  end

  def sample_yandex_money_preview
    AdminMailer.yandex_money_email
  end

  def new_order_preview
    AdminMailer.new_order_email
  end
end
