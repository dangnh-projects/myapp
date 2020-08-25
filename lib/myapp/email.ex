defmodule Myapp.Email do
  import Bamboo.Email

  def welcome_email do
    new_email(
      to: "b0yb0m113@gmail.com",
      from: "dangnh@nhg.vn",
      subject: "Welcome to the app.",
      html_body: "<strong>Thanks for joining!</strong>",
      text_body: "Thanks for joining!"
    )
  end
end
