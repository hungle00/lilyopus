require 'lilypond'

class ConvertLilypondJob < ApplicationJob
  queue_as :default

  def perform(file_path, filename)
    # Do something later
    Lilypond.new(file_path, filename).transcript_ly
  end
end
