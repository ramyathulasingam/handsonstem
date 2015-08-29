class AuthController < ApplicationController
  def eventbriteCallback
    @code =  params[:code]
    
    uri = URI.parse("https://www.eventbrite.com/oauth/token?code=THE_USERS_AUTH_CODE&client_secret=YOUR_CLIENT_SECRET&client_id=YOUR_API_KEY&grant_type=authorization_code")
    http = Net::HTTP.new(uri.host, nil)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new("/v1.1/auth")
    request.add_field('Content-Type', 'application/x-www-form-urlencoded')
    request.set_form_data({ ‘code’ => @code, ‘client_secret’ => "QKAURIDJ2E37OVWZOXMJLAMUGISHXLTLQR2IOBNNNTWAAU53BD" })
    response = http.request(request)
    puts response.body.read
  end
end
