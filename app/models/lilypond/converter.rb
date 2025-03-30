class Lilypond::Converter
  LILY_PATH = "tmp/storage/"

  attr_reader :input_file, :output_file
  
  def initialize(input_file, file_name)
  	@input_file = input_file
    @output_file = Rails.root.join(LILY_PATH, file_name)
  end

  def li_to_video
    fork {
      exec("ly2video -i #{input_file}")
    }
  end

  def transcript_ly
    fork { 
      exec("lilypond -dno-point-and-click -o #{output_file} #{input_file}") 
    }
  end
end
