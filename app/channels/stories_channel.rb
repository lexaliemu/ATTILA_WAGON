class StoriesChannel < ApplicationCable::Channel
  def subscribed
    stream_from "stories_#{params[:user_id]}"
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
