class TodosController < ApplicationController
  def index
    @todos = Todo.all
  end

  def new
    @todo = Todo.new
  end

  def create
    @todo = Todo.new(todo_params)
    if @todo.save
      flash[:notice] = "Todo has been created."
      redirect_to @todo
    else
      flash[:alert] = "Todo has not been created."
      render :new
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
    if @todo.update(todo_params)
      flash[:notice] = "Todo has been updated."
      redirect_to @todo
    else
      flash[:alert] = "Todo has not been updated."
      render action: "edit"
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
end
