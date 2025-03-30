class ConvertLilypondJob < ApplicationJob
  queue_as :default

  def perform(file_name)
    # Do something later
    input_file = Rails.root.join('storage', 'uploads', file_name)
    Lilypond::Converter.new(input_file, file_name).transcript_ly
    
    ActionCable.server.broadcast "convert_lilypond", { 
      pdf: "#{file_name}.pdf",
      midi: "#{file_name}.midi"
    }
  end
end
