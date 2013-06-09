require 'test_helper'

class UserFriendshipTest < ActiveSupport::TestCase
  should belong_to(:user)
  should belong_to(:friend)
  
  test "that creating a friendship works without raising an exception" do
  assert_nothing_raised do
    UserFriendship.create user: users(:jason), friend: users(:barry)
   end 
  end
  
  test "that creating friendships based on user id and friend id works" do
    UserFriendship.create user_id: users(:barry).id, friend_id: users(:jim).id
    assert users(:barry).friends.include?(users(:jim))
  end
end
