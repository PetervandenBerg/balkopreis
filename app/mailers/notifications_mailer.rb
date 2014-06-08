class NotificationsMailer < ActionMailer::Base

  default :from => "info@balkopreis.nl"
  default :to => "pienenharm@hotmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Nieuw prive bericht], #{message.name}")
  end

end