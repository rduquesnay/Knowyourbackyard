class Contactmailer < ActionMailer::Base
  default from: "from@example.com"

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.contactmailer.reply.subject
  #
  def reply(content)
    @greeting = "Hi"
    @admin = content[:from]
    @contact = content[:to]
    @message = content[:message]
    mail to: content[:to].email, subject: "RE: "+content[:to].subject
  end
end
