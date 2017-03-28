require 'rest_client'
require 'json'

def main_server(endpoint)
  "https://www.bloc.io/api/v1/#{endpoint}"
end

def mock_server(endpoint)
  "https://private-b3c66-blocapi.apiary-mock.com/api/v1/#{endpoint}"
end

module Roadmap
  def get_roadmap(r_id)
    JSON.parse RestClient.get main_server("roadmaps/#{r_id}"), @headers
  end

  def get_checkpoint(c_id)
    JSON.parse RestClient.get main_server("checkpoints/#{c_id}"), @headers
  end
end
