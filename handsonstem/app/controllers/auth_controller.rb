class AuthController < ApplicationController
  def eventbriteCallback
    code = params[:code]

    uri = URI.parse("https://www.eventbrite.com/oauth/token?code=" + code + "&client_secret=QKAURIDJ2E37OVWZOXMJLAMUGISHXLTLQR2IOBNNNTWAAU53BD&client_id=LM35T2HNQKLMFV5WVQ&grant_type=authorization_code")
    http = Net::HTTP.new(uri.host, 443)
    http.use_ssl = true
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    request = Net::HTTP::Post.new(uri.request_uri)
    request.add_field('Content-Type', 'application/x-www-form-urlencoded')
    request.set_form_data({ 'code' => code, 'client_secret' => "QKAURIDJ2E37OVWZOXMJLAMUGISHXLTLQR2IOBNNNTWAAU53BD", 'grant_type' => 'authorization_code', 'client_id' => 'LM35T2HNQKLMFV5WVQ' })
    response = http.request(request)
    puts "RESPONSE:"
    puts response.code
    puts response.body.class
    resp = JSON.parse(response.body)
    access_token = resp["access_token"]
    puts "Token: "
    puts access_token
    
    session[:eventbrite_auth_token] = access_token
    if @current_user
      redirect_to :controller => "home", :action => "index"
    else
      redirect_to :controller => "users", :action => "create"
    end
  end
end
