defmodule Myapp.Email do
  import Bamboo.Email

  def welcome_email do
    new_email
    |> from("dangnh@nhg.vn")
    |> to("b0yb0m113@gmail.com")
    |> subject("Welcome!!!")
    |> html_body("<strong>Welcome</strong>")
    |> text_body("Thanks for joining!")
  end
end
