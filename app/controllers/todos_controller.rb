class TodosController < ApplicationController
  before_action :set_todo, only: [:show, :edit, :destroy, :update]
  def index
    @todos = Todo.where(user_id: session[:user_id]).order("created_at ASC")
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    @todo.user_id = session[:user_id]
    respond_to do |format|
      format.html do
        if @todo.save
          flash[:notice] = "Todo has been created."
          redirect_to @todo
        else
          flash[:alert] = "Todo has not been created."
          render :new
        end
      end
      format.js do
        unless @todo.save
          render text: @todo.errors.full_messages.join, status: :unprocessable_entity
        end
      end
    end
  end

  def show
    @todo = Todo.find(params[:id])
  end

  def edit
    @todo = Todo.find(params[:id])
  end

  def update
    @todo = Todo.find(params[:id])
    respond_to do |format|
      format.html do
        if @todo.update(todo_params)
          flash[:notice] = "Todo has been updated."
          redirect_to @todo
        else
          flash[:alert] = "Todo has not been updated."
          render action: "edit"
        end
      end
      format.js do
        unless @todo.update(todo_params)
          render text: @todo.errors.full_messages.join, status: :unprocessable_entity
        end
      end
    end
  end

  def destroy
    @todo = Todo.find(params[:id])
    @todo.destroy

    flash[:notice] = "Todo has been deleted."
    redirect_to todos_path
  end

  private
  def todo_params
    params.require(:todo).permit(:todo)
  end

  def set_todo
    @todo = Todo.find(params[:id])
  rescue ActiveRecord::RecordNotFound
    flash[:alert] = "The todo you are looking for could not be found."
    redirect_to todos_path
  end
end
