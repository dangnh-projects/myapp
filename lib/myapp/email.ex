defmodule Myapp.Email do
  import Bamboo.Email
  use Bamboo.Phoenix, view: MyappWeb.EmailView

  def working_daily_mail_morning(dateMail, minTime, user) do
    from_mail_address = "dangnh@nhg.vn"
    to_mail_address = "b0yb0m113@gmail.com"
    subtext = "Daily check fingerprint notifications"

    new_email
    |> from(from_mail_address)
    |> to(to_mail_address)
    |> subject(subtext)
    |> render("email_morning.html", user: user, dateMail: dateMail, minTime: minTime)
  end

  def working_daily_mail_night(dateMail, minTime, maxTime, user) do
    from_mail_address = "dangnh@nhg.vn"
    to_mail_address = "b0yb0m113@gmail.com"
    subtext = "Daily check fingerprint notifications"

    new_email
    |> from(from_mail_address)
    |> to(to_mail_address)
    |> subject(subtext)
    |> render("email_night.html", user: user, dateMail: dateMail, minTime: minTime, maxTime: maxTime)


    #users = Accounts.get_user!()
    #{:ok, datetime} = DateTime.from_unix(users.nEndDate)
    #mail_date = Timex.end_of_day(datetime)
    #unix_time = DateTime.to_unix(datetime)
    #date_mail = Timex.format!(datetime, "%d/%m/%Y", :strftime)
    #time_mail = Timex.format!(datetime, "%I:%M %p", :strftime)
    #datetime_stamp = TimeStamp.timestamp_to_datetime(users.nStartDate)
    #render(conn, "index.html", users: users)
    #start_date = Timex.beginning_of_day(datetime)


    #|> html_body("<strong>Welcome</strong>")
    #|> put_html_layout({MyappWeb.LayoutView, "email.html"})
    #|> render(:sign_in, users: users)
    #|> text_body("Thanks for joining!")
  end
end
