class TodoListsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_todo_list, only: [:show, :update, :destroy]

  def index
    @page = params[:page] ? params[:page].to_i : 1
    @size = params[:size] ? params[:size].to_i : 10
    @todo_lists = current_user.todo_lists.includes(:todo_list_items).page(@page).per(@size)
  end

  def show
  end

  def create
    @todo_list = current_user.todo_lists.new(todo_list_params)

    if @todo_list.save
      render :show, status: :created
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  def update
    if @todo_list.update(todo_list_params)
      render :show, status: :ok
    else
      render json: @todo_list.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @todo_list.destroy
  end

  private
    def set_todo_list
      @todo_list = current_user.todo_lists.find(params[:id])
      render json: { messge: "Record not found with ID" }, status: 404 if @todo_list.blank?
    end

    def todo_list_params
      params.require(:todo_list).permit(:title, :description)
    end
end
