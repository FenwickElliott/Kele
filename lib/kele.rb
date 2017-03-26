require 'rest_client'
require 'json'

class Kele
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

  def get_roadmap(r_id)
    JSON.parse RestClient.get "https://www.bloc.io/api/v1/roadmaps/#{r_id}", @headers
  end

  def get_checkpoint(c_id)
    JSON.parse RestClient.get "https://www.bloc.io/api/v1/checkpoints/#{c_id}", @headers
  end
end
