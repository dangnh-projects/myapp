defmodule Myapp.SendMail do
  alias Myapp.Email
  alias Myapp.Mailer

  def send_mail(dateMail, minTime, user) do
    Email.welcome_email(dateMail, minTime, user)   # Create your email
    |> Mailer.deliver_now # Send your email
  end

  def send_mail_night(dateMail, minTime, maxTime, user) do
    Email.working_daily_mail_night(dateMail, minTime, maxTime, user)   # Create your email
    |> Mailer.deliver_now # Send your email
  end
end
