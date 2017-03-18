module NotificationsHelper
  def posted_time(time)
    time > Date.today ? "#{time_ago_in_words(time)}" : time.strftime('%m月%d日')
  end

  def display_read_status(read)
    read ? "既読" : "未読"
  end
end
