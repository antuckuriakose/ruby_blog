require 'test_helper'

class CommentTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "should not save without comment body" do
    comment  = Comment.new
   	comment.commenter = "Testing"
   	assert_not comment.save, "saved without comment body"
  end
end
