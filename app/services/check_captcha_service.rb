require 'httparty'

# Service for checking google recaptcha
class CheckCaptchaService
  include HTTParty
  base_uri 'https://www.google.com/recaptcha/api/siteverify'

  def check(args = {})
    response = self.class.post('', query: { secret: ENV['CAPTCHA_SECRET'], response: args[:result] })
    response.parsed_response
  end
end
