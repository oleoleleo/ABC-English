class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def new
    @topic = Topic.new
  end

  def create
    @topic = current_user.topics.new(topic_params)
    if @topic.save
      redirect_to topics_path, success: 'Posted'
    else
      flash.now[:danger] = "Try again"
      render :new
    end
  end

  private
  def topic_params
    params.require(:topic).permit(:image, :description)
  end

end
