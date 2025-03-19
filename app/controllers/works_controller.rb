class WorksController < ApplicationController
  def show
    @work = Work.find(params[:id])
  end
  
  def new
    @work = Work.new
  end

  def create
    @work = Work.new(work_params)
    if @work.save
      redirect_to @work, notice: 'Opus was successfully created.'
    else
      render :new, notice: 'Opus was successfully created.'
    end
  end

  private

  def work_params
    params.require(:work).permit(:title, :lily_file)
  end
end
