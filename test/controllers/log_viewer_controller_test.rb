require 'test_helper'

class LogViewerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get log_viewer_index_url
    assert_response :success
  end

end
