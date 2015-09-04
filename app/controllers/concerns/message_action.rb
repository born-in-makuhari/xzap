# コントローラーで、
# 次の画面で表示したいビューを貯めるメソッドmessage
module MessageAction
  def message(message)
    @messages ? @messages << message : @messages = [message]
  end
  attr_reader :messages
end
