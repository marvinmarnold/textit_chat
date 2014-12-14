require 'test_helper'

class PushNotificationsControllerTest < ActionController::TestCase
  setup do
    @push_notification = push_notifications(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:push_notifications)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create push_notification" do
    assert_difference('PushNotification.count') do
      post :create, push_notification: { message: @push_notification.message, tag: @push_notification.tag }
    end

    assert_redirected_to push_notification_path(assigns(:push_notification))
  end

  test "should show push_notification" do
    get :show, id: @push_notification
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @push_notification
    assert_response :success
  end

  test "should update push_notification" do
    patch :update, id: @push_notification, push_notification: { message: @push_notification.message, tag: @push_notification.tag }
    assert_redirected_to push_notification_path(assigns(:push_notification))
  end

  test "should destroy push_notification" do
    assert_difference('PushNotification.count', -1) do
      delete :destroy, id: @push_notification
    end

    assert_redirected_to push_notifications_path
  end
end
