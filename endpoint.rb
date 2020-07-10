# frozen_string_literal: true

require 'sinatra'
require 'net/http'
require 'json'
require './board'

get '/solve' do
  uri = URI('https://mine-sweeper-generator.herokuapp.com/solver')

  response = Net::HTTP.get_response(uri)
  if response.is_a?(Net::HTTPSuccess)
    board = Board.new(JSON.parse(response.body))
    {
      problem: response.body,
      solution: board.solve.to_s
    }.to_s
  else
    {
      error: 'Network Error'
    }.to_s
  end
end
