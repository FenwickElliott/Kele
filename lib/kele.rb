require 'httparty'
require 'json'

class Kele
  def initialize(email, password)
    res = JSON.parse HTTParty.post("https://www.bloc.io/api/v1/sessions", body: { "email": email, "password": password } ).body

    @auth_token = res['auth_token']

  end
end
