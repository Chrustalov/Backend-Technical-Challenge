class TasksController < ApplicationController
  # before_action :set_question!

  def index 
    @tasks = Task.all.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  def update_status
    @task = Task.find(params[:id])
    @task.update(status: params[:status])
    session[:return_to] ||= request.referer
    redirect_to session.delete(:return_to)
  end

  def show; end

  def new 
    @task = Task.new
  end

  def create 
    @task = Task.new(task_params)

    if @task.save
      redirect_to tasks_path, notice: 'Task was successfully created.'
    else
      render :new
    end
  end

  private

  def task_params
    params.require(:task).permit(:name, :status, :member_id)
  end

  # def set_question!
  #   @member = Member.find params[:member_id]
  # end
end