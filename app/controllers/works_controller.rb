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
      render :new, notice: 'Opus was failed to create.'
    end
  end

  def upload_ly
    lily_file = params[:file]
    
    Lilypond::Uploader.new(lily_file).save

    render json: {
      output_file: lily_file.original_filename
    }
  end

  def convert
    file_name = params[:lily_file]
    ConvertLilypondJob.perform_later(file_name) if file_name.present?
    head :accepted
  end

  def download 
    exported_file_name = params[:filename]

    respond_to do |format|
      format.pdf do
        send_file Rails.root.join(Lilypond::Converter::LILY_PATH, exported_file_name), type: :pdf, filename: exported_file_name
      end

      format.midi do
        send_file Rails.root.join(Lilypond::Converter::LILY_PATH, exported_file_name), type: :midi, filename: exported_file_name
      end
    end
  end


  private

  def work_params
    params.require(:work).permit(:title, :lily_file)
  end
end
