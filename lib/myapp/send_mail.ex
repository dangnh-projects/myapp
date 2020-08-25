defmodule Myapp.SendMail do
  alias Myapp.Email
  alias Myapp.Mailer

  def send_mail do
    Email.welcome_email()   # Create your email
    |> Mailer.deliver_now() # Send your email
  end
end
