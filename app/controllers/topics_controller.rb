class TopicsController < ApplicationController
  def index
    @topics = Topic.all
  end

  def show
    @topic = Topic.find(params[:id])
  end

  def new
    @topic = Topic.new
    render partial: 'form'
  end

  def create
    @topic = Topic.new(topic_params)
    if @topic.save
      redirect_to [@sub, @topic]
    else
      render :new
    end
  end

  def edit
    @topic = Topic.find(params[:id])
    render partial: 'form'
  end

  def update
    @topic = Topic.find(params[:id])
    if @topic.update(topic_params)
      redirect_tp [@sub, @topic]
    else
      render :edit
    end
  end

  def destroy
    @topic = Topic.find(params[:id])
    @topic.destroy
    redirect_to sub_topics_path(@sub)
  end

  private
    def topic_params
      params.require(:topic).permit(:title, :body)
    end
end
