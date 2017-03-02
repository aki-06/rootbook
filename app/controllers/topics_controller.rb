class TopicsController < ApplicationController
  def index
    @topic = Topic.new
  end
end
