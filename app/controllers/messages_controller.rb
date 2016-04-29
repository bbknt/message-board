class MessagesController < ApplicationController
  before_action :set_message, only: [:edit, :update, :destroy]
  
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_parms)
    if @message.save
      redirect_to root_path , notice: "メッセージを保存しました"
    else
      @messages = Message.all
      flash.now[:alert] = "メッセージの保存に失敗しました"
      render "index"
    end
  end
  
  def edit
  end
  
  def update
    if @message.update(message_parms)
      redirect_to root_path , notice: "メッセージを編集しました"
    else
      render "edit"
    end
  end
  
  def destroy
    @message.destroy
    redirect_to root_path , notice: "メッセージを削除しました"
  end
  
  private
  def message_parms
    params.require(:message).permit(:name, :body)
  end
  
  def set_message
    @message = Message.find(params[:id])
  end
  
  ## ここまで
end
