require 'test_helper'

class UserTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  test "unread messages" do
    u = users(:marvin)
    c = u.chats.create
    assert u.unread_messages(c).size == 0

    m = c.messages.create(from: "123", to: "456")
    assert u.unread_messages(c).size == 1
  end

  test "subscribe users to chat" do
    u = User.create!(email: "fake@faker.com", password: "password")
    c = Chat.create!

    assert u.chats.size == 0

    u.subscribe_to c
    assert u.chats(true).size == 1

    u.subscribe_to c
    assert u.chats(true).size == 1

  end
end
