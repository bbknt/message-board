class MessagesController < ApplicationController
  def index
    @message = Message.new
    @messages = Message.all
  end
  
  def create
    @message = Message.new(message_parms)
    @message.save
    redirect_to root_path , notice: "メッセージを保存しました"
  end
  
  private
  def message_parms
    params.require(:message).permit(:name, :body)
  end
  ## ここまで
end
