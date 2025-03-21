require 'lilypond'

class ConvertLilypondJob < ApplicationJob
  queue_as :default

  def perform(file_path, filename)
    # Do something later
    filename = filename.presence || self.job_id
    output_file = Lilypond.new(file_path, filename).transcript_ly
    ActionCable.server.broadcast "convert_lilypond", { 
      pdf: "#{output_file}.pdf",
      midi: "#{output_file}.midi"
    }
  end
end
