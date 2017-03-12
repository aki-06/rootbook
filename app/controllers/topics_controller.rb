class TopicsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_topic, only:[:edit, :update, :destroy, :show]

  def index
    @topics = Topic.all.reverse_order
  end

  def show
    @comment = @topic.comments.build
    @comments = @topic.comments
  end

  def new
    if params[:back]
      @topic = Topic.new(topics_params)
    else
      @topic = Topic.new
    end
  end

  def create
    @topic = Topic.new(topics_params)
    @topic.user_id = current_user.id
    if @topic.save
      flash[:success] = "Topicを作成しました！"
      NoticeMailer.sendmail_topic(@topic).deliver
      redirect_to topics_path
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @topic.update(topics_params)
      flash[:info] = "Topicを更新しました！"
      redirect_to topics_path
    else
      render 'edit'
    end
  end

  def destroy
    @topic.destroy
    flash[:danger] = "Topicを削除しました！"
    redirect_to topics_path
  end

  def confirm
    @topic = Topic.new(topics_params)
    render :new if @topic.invalid?
  end

  private
  def topics_params
    params.require(:topic).permit(:title, :content)
  end

  def set_topic
    @topic = Topic.find(params[:id])
  end
end
