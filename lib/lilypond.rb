class Lilypond
  attr_reader :input_file, :output_file
  
  def initialize(input_file, output_file)
  	@input_file = input_file
    @output_file = output_file
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
