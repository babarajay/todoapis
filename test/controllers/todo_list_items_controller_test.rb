require 'test_helper'

class TodoListItemsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @todo_list_item = todo_list_items(:one)
  end

  test "should get index" do
    get todo_list_items_url, as: :json
    assert_response :success
  end

  test "should create todo_list_item" do
    assert_difference('TodoListItem.count') do
      post todo_list_items_url, params: { todo_list_item: { completed: @todo_list_item.completed, title: @todo_list_item.title, todo_list_id: @todo_list_item.todo_list_id } }, as: :json
    end

    assert_response 201
  end

  test "should show todo_list_item" do
    get todo_list_item_url(@todo_list_item), as: :json
    assert_response :success
  end

  test "should update todo_list_item" do
    patch todo_list_item_url(@todo_list_item), params: { todo_list_item: { completed: @todo_list_item.completed, title: @todo_list_item.title, todo_list_id: @todo_list_item.todo_list_id } }, as: :json
    assert_response 200
  end

  test "should destroy todo_list_item" do
    assert_difference('TodoListItem.count', -1) do
      delete todo_list_item_url(@todo_list_item), as: :json
    end

    assert_response 204
  end
end
