require 'rest_client'
require 'json'
require './lib/roadmap'
require './lib/credentials'

class Kele
  include Roadmap
  include Credentials

  def main_server(endpoint)
    "https://www.bloc.io/api/v1/#{endpoint}"
  end

  def mock_server(endpoint)
    "https://private-b3c66-blocapi.apiary-mock.com/api/v1/#{endpoint}"
  end

  def initialize(email=Credentials.email, password=Credentials.password)
    body = {
      :email => email,
      :password => password
    }
    auth = JSON.parse RestClient.post main_server('sessions'), body

    @auth_token = auth['auth_token']
    @headers = {
      :content_type => 'application/json',
      :authorization => @auth_token
    }
  end

  def get_me
      JSON.parse RestClient.get main_server('/users/me'), @headers
  end

  def get_mentor_availability
    JSON.parse RestClient.get main_server("mentors/#{get_me["current_enrollment"]['mentor_id']}/student_availability"), @headers
  end

  def get_messages
    JSON.parse RestClient.get main_server('message_threads'), @headers
  end
end
