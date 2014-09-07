require File.dirname(__FILE__) + '/../test_helper'
require 'character_generator_controller'

# Re-raise errors caught by the controller.
class CharacterGeneratorController; def rescue_action(e) raise e end; end

class CharacterGeneratorControllerTest < Test::Unit::TestCase
  def setup
    @controller = CharacterGeneratorController.new
    @request    = ActionController::TestRequest.new
    @response   = ActionController::TestResponse.new
  end

  # Replace this with your real tests.
  def test_truth
    assert true
  end
end
