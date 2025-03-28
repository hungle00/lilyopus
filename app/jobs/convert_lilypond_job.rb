require 'lilypond'

class ConvertLilypondJob < ApplicationJob
  queue_as :default

  def perform(input_path, filename)
    # Do something later
    filename = filename.presence || self.job_id
    output_file = [Work::LILY_PATH, filename].join("/")
    Lilypond.new(input_path, output_file).transcript_ly
    
    ActionCable.server.broadcast "convert_lilypond", { 
      pdf: "#{filename}.pdf",
      midi: "#{filename}.midi"
    }
  end
end
