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
      :authorization => @auth_token
    }

    @mock_headers = {
      :content_type => 'application/json',
      :authorization => "eyJ0eXAiOiJKV1QiLCJhhGciOiJIUzI1NiJ9.eyJhcGlfa2V5IjoiYTc2MDZkNTBhYjA3NDE4ZWE4ZmU5NzliY2YxNTM1ZjAiLCJ1c2VyX2lkIjoyMzAzMTExLCJuYW1lIjoiQmVuIE5lZWx5In0.3VXD-FxOoxaGXHu6vmL8g191bl5F_oKe9qj8Khmp9F0"
    }

  end

  def create_submission(e_id, c_id, acl, c)
    body = {
      "assignment_commit_link":acl,
      "checkpoint_id":c_id,
      "comment":c,
      "enrollment_id":e_id,
    }

    JSON.parse RestClient.post main_server('checkpoint_submissions'), body, @headers

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

  def get_mock_messages
    RestClient.get mock_server('message_threads'), @mock_headers
  end

  def create_message
    body = {
      "sender": "charles@fenwickelliott.io",
      "recipient_id": 2290632,
      "token": "9e99d7f3-5821-478b-a39a-1b754550dc2e",
      "subject": "Main Test Message",
      "stripped-text": "This is generated by kele"
    }

    RestClient.post main_server('messages'), @headers, body
  end

  def create_mock_message
    body = {
      "sender": "charles@fenwickelliott.io",
      "recipient_id": 2290632,
      "token": "abcd",
      "subject": "Mock Test Message",
      "stripped-text": "This is generated by kele"
    }

    RestClient.post mock_server('messages'), @mock_headers, body
  end
end
