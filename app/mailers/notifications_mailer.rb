class NotificationsMailer < ActionMailer::Base

  default :from => "info@balkopreis.nl"
  default :to => "peter_vd_berg@hotmail.com"

  def new_message(message)
    @message = message
    mail(:subject => "[Nieuw prive bericht], #{message.subject}")
  end

end