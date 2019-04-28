class TodoListItemsController < ApplicationController
  before_action :set_todo_list
  before_action :set_todo_list_item, only: [:show, :update, :destroy, :complete]

  def index
    @todo_list_items = @todo_list.todo_list_items
  end

  def show
  end

  def create
    @todo_list_item = @todo_list.todo_list_items.new(todo_list_item_params)

    if @todo_list_item.save
      render :show, status: :created
    else
      render json: @todo_list_item.errors, status: :unprocessable_entity
    end
  end

  def update
    if @todo_list_item.update(todo_list_item_params)
      render :show, status: :ok
    else
      render json: @todo_list_item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_list_item.destroy
  end

  def complete
    puts "====="
    puts @todo_list_item.to_json
    puts "====="
    @todo_list_item.complete
  end

  private
    def set_todo_list_item
      @todo_list_item = @todo_list.todo_list_items.find_by_id(params[:id])
      puts "=test==="
      puts @todo_list_item.to_json
      puts "===="
      render json: { messge: "List item not found." }, status: 404 if @todo_list_item.blank?
    end

    def set_todo_list
      @todo_list = TodoList.find_by_id(params[:todo_list_id])
      puts "===="
      puts @todo_list.to_json
      puts "===="
      render json: { messge: "List not found." }, status: 404 if @todo_list.blank?
    end

    def todo_list_item_params
      params.require(:todo_list_item).permit(:todo_list_id, :title)
    end
end
