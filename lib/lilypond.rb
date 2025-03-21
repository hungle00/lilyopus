class Lilypond
  attr_reader :input_file, :file_name
  
  def initialize(input_file, file_name)
  	@input_file = input_file
  	@file_name = file_name
  end

  def li_to_video
    fork {
      exec("ly2video -i #{file_name}")
    }
  end

  def transcript_ly
    fork { 
      exec("lilypond -dno-point-and-click -o #{output_file} #{input_file}") 
    }
    output_file
  end

  private

  def output_file
    ["tmp/storage", file_name].join("/")
  end
end
