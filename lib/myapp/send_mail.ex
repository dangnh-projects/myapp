defmodule Myapp.SendMail do
  alias Myapp.Email
  alias Myapp.Mailer

  def send_mail_morning(dateMail, minTime, user) do
    Email.working_daily_mail_morning(dateMail, minTime, user)   # Create your email
    |> Mailer.deliver_now # Send your email
  end

  def send_mail_night(dateMail, minTime, maxTime, user) do
    Email.working_daily_mail_night(dateMail, minTime, maxTime, user)   # Create your email
    |> Mailer.deliver_now # Send your email
  end
end
