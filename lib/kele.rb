require 'rest_client'
require 'json'
require './lib/roadmap'

class Kele
  include Roadmap
  def initialize(email, password)
    body = {
      :email => email,
      :password => password
    }
    auth = JSON.parse RestClient.post 'https://www.bloc.io/api/v1/sessions', body

    @auth_token = auth['auth_token']
    @headers = {
      :content_type => 'application/json',
      :authorization => @auth_token
    }
  end

  def get_me
      JSON.parse RestClient.get 'https://www.bloc.io/api/v1/users/me', @headers
  end

  def get_mentor_availability
    response = JSON.parse RestClient.get "https://www.bloc.io/api/v1/mentors/#{get_me["current_enrollment"]['mentor_id']}/student_availability", @headers
    puts response
  end
end
