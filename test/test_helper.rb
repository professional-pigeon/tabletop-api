ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

module SignInHelper
  def sign_in_as(user)
    post api_auth_login_path(user_name: user.user_name, password: 'mUc3m00RsqyRe')
  end

  # def sign_out
  #   get logout_path
  # end
end

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  include FactoryBot::Syntax::Methods
  DatabaseCleaner.strategy = :transaction

  setup do
    DatabaseCleaner.start
  end
  teardown do
    DatabaseCleaner.clean
  end

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods
  include SignInHelper
  DatabaseCleaner.strategy = :truncation

  setup do
    DatabaseCleaner.start
  end
  teardown do
    DatabaseCleaner.clean
  end

  def parsed_response
    parsed = JSON.parse(response.body)
    if parsed.is_a?(Hash)
      parsed.with_indifferent_access
    else
      parsed
    end
  end
end