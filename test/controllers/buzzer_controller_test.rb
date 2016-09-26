require 'test_helper'

class BuzzerControllerTest < ActionDispatch::IntegrationTest
  test 'should get enter_code' do
    get buzzer_enter_code_url
    assert_response :success
  end

  test 'should get call_me' do
    get buzzer_call_me_url
    assert_response :success
  end

  test 'should get buzz_answerer' do
    get buzzer_buzz_answerer_url
    assert_response :success
  end
end
