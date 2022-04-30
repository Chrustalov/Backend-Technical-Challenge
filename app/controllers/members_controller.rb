class MembersController < ApplicationController
  def index
    @members = Member.all
  end

  def new 
    @member = Member.new
  end

  def create 
    @member = Member.new(member_params)
    if @member.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @member = Member.find(params[:id])
    @tasks = @member.tasks.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  private

  def member_params 
    params.require(:member).permit(:name)
  end
end
