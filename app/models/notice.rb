class Notice
  def initialize(params)
    
    case params[:type]
    when "Revision Reviewed"
      @note = Notification.new(message: "Your Revision has been reviewed and changes are requested.", link: "<a class=\"btn btn-primary\" href=\"\/revisionreviews\/#{params[:link_id]}\">Go to Revision Review<\/a>", user_id: params[:to_user])
    when "Trail Reviewed Needs Changes"
      @note = Notification.new(message: "Your Trail: id: #{params[:trail_id]} Name: #{params[:trail_name]}, has been reviewed and changes are requested.", link: "<a class=\"btn btn-primary\" href=\"\/reviews\/#{params[:link_id]}\">Go to Trail Review<\/a>", user_id: params[:to_user])
    when "Trail Reviewed Accepted"
      @note = Notification.new(message: "Your Trail: id: #{params[:trail_id]} Name: #{params[:trail_name]}, has been reviewed and accepted.", link: "<a class=\"btn btn-primary\" href=\"\/trails\/#{params[:link_id]}\">Go to Trail<\/a>", user_id: params[:to_user])
    when "Dispute Accepted"
      @note = Notification.new(message: "Your Dispute has been Accepted.", link: "<a class=\"btn btn-primary\" href=\"\/resolved#{params[:dispute_type]}disputes\/#{params[:link_id]}\">Go to Resolved Dispute<\/a>", user_id: params[:to_user])
    when "Dispute Dismissed"
      @note = Notification.new(message: "Your Dispute has been Dismissed.", link: "<a class=\"btn btn-primary\" href=\"\/resolved#{params[:dispute_type]}disputes\/#{params[:link_id]}\">Go to Resolved Dispute<\/a>", user_id: params[:to_user])
    when "New Message"
      @note = Notification.new(message: "A new message has been created in the chat area.", link: "<a class=\"btn btn-primary\" href=\"\/chats\/#{params[:link_id]}\">Go to Chat<\/a>", user_id: params[:to_user])
    when "New Chat"
      @note = Notification.new(message: "A chat area for you contact has been generated.", link: "<a class=\"btn btn-primary\" href=\"\/chats\/#{params[:link_id]}\" >Go to Chat<\/a>", user_id: params[:to_user])
    end
  end

  def send
    @note.save
  end
end
