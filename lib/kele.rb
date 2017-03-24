require 'rest_client'
require 'json'

class Kele
  def initialize(email, password)
    body = {
      :email => email,
      :password => password
    }
    res = JSON.parse RestClient.post 'https://www.bloc.io/api/v1/sessions', body

    @auth_token = res['auth_token']
  end

  def get_me
      headers = {
        :content_type => 'application/json',
        :authorization => @auth_token
      }
      user = JSON.parse RestClient.get 'https://www.bloc.io/api/v1/users/me', headers
      puts user['name']
  end
end
