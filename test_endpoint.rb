# frozen_string_literal: true

ENV['APP_ENV'] = 'test'

require 'test/unit'
require 'rack/test'
require 'webmock/minitest'
require './endpoint'

# Test the best case scenario, solving the problem
# according to a preestablished board
class EndpointTest < Test::Unit::TestCase
  include Rack::Test::Methods
  include WebMock::API

  def app
    Sinatra::Application
  end

  def simple_problem
    [['+', '-', '-', '-', '+'],
     ['|', '*', '*', '*', '|'],
     ['|', '*', ' ', '*', '|'],
     ['|', '*', '*', '*', '|'],
     ['+', '-', '-', '-', '+']].to_s
  end

  def simple_solution
    [['+', '-', '-', '-', '+'],
     ['|', '*', '*', '*', '|'],
     ['|', '*', '8', '*', '|'],
     ['|', '*', '*', '*', '|'],
     ['+', '-', '-', '-', '+']].to_s
  end

  def request
    WebMock.enable!
    stub_request(:get, 'https://mine-sweeper-generator.herokuapp.com/solver')
      .to_return(body: simple_problem)
  end

  def test_endpoint
    request
    get '/solve'
    assert last_response.ok?
    response =
      {
        problem: simple_problem,
        solution: simple_solution
      }.to_s
    assert_equal response, last_response.body
  end
end
