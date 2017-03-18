class CommentsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_comment, only: [:edit, :update, :destroy]


  def create
    @comment = current_user.comments.build(comment_params)
    @topic = @comment.topic
    @notification = @comment.notifications.build(user_id: @topic.user.id )

    respond_to do |format|
      if @comment.save
        format.html { redirect_to topic_path(@topic), notice: 'コメントを投稿しました。' }
        format.json { render :show, status: :created, location: @comment }
        format.js { render :index }
        unless @comment.topic.user.id == current_user
        Pusher.trigger("user_#{@comment.topic.user_id}_channnel", 'comment_created', {
          message: 'Topicにコメントが付きました'
        })
      end
      Pusher.trigger("user_#{@comment.topic.user_id}_channel", 'notification_created', {
          unread_counts: Notification.where(user_id: @comment.topic.user.id, read: false).count
        })
      else
        format.html { render :new }
        format.json { render json: @comment.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
  end

  def update
    if @comment.update(comment_params)
      redirect_to topic_path(@comment.topic)
    else
      render :edit
    end
  end

  def destroy
    @commets = @comment.topic.comments
    @comment.destroy
    respond_to do |format|
      format.js { render :index }
    end

  end

  private

    def comment_params
      params.require(:comment).permit(:topic_id, :content)
    end

    def set_comment
      @comment = current_user.comments.find(params[:id])
    end
end
