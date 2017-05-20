class TasklistsController < ApplicationController
  before_action :set_tasklist, only: [:show, :edit, :update, :destroy]
  def index
    @tasklists = Tasklist.order(created_at: :desc).page(params[:page]).per(3)
  end

  def show
    
  end

  def new
    @tasklist = Tasklist.new
  end

  def create
    @tasklist = Tasklist.new(tasklist_params)

    if @tasklist.save
      flash[:success] = 'tasklist が正常に投稿されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'tasklist が投稿されませんでした'
      render :new
    end
  end

  def edit
   
  end

  def update
    @tasklist = Tasklist.find(params[:id])

    if @tasklist.update(tasklist_params)
      flash[:success] = 'Tasklist は正常に更新されました'
      redirect_to @tasklist
    else
      flash.now[:danger] = 'Tasklist は更新されませんでした'
      render :edit
    end
  end

  def destroy
    @tasklist = Tasklist.find(params[:id])
    @tasklist.destroy

    flash[:success] = 'Tasklist は正常に削除されました'
    redirect_to tasklists_url
  end
  
  private
  
   def set_tasklist
    @tasklist = Tasklist.find(params[:id])
   end


  # Strong Parameter
  def tasklist_params
    # ActionController::Parametersというクラスのインスタンス
    params.require(:tasklist).permit(:content,:status)
    
  end
end
