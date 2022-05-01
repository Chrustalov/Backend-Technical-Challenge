class MembersController < ApplicationController
  before_action :set_member!, only: [:show]

  def index
    @members = Member.all.order(created_at: :desc)
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
    @tasks = @member.tasks.order(created_at: :desc).paginate(page: params[:page], per_page: 5)
  end

  private

  def member_params 
    params.require(:member).permit(:name)
  end

  def set_member! 
    @member = Member.find(params[:id])
  end
end
