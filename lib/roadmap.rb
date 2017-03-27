require 'rest_client'
require 'json'

module Roadmap
  def get_roadmap(r_id)
    JSON.parse RestClient.get "https://www.bloc.io/api/v1/roadmaps/#{r_id}", @headers
  end

  def get_checkpoint(c_id)
    JSON.parse RestClient.get "https://www.bloc.io/api/v1/checkpoints/#{c_id}", @headers
  end
end
