class ConvertLilypondChannel < ApplicationCable::Channel
  def subscribed
    stream_from "convert_lilypond"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
