defmodule Myapp.GetLogs do
  alias Myapp.EventLogs
  alias Myapp.Accounts
  alias Myapp.SendMail
  alias Timex

  def get_event_log_day_morning do
    get_users = Accounts.select_users()
    date_mail = Timex.format!(Timex.now("Asia/Ho_Chi_Minh"), "%d/%m/%Y", :strftime)

    if length(get_users) > 0 do
      for user <- get_users do
        get_data = EventLogs.list_event_days()
        if length(get_data) > 0 do
          %{nDateTime: min_date_unix} = Enum.min_by(get_data, fn x -> x.nDateTime end)
          min_date = Timex.from_unix(min_date_unix)
          min_time_format = Timex.format!(min_date, "%I:%M %p", :strftime)
          # send mail morning
          SendMail.send_mail_morning(date_mail, min_time_format, user)
        else
          SendMail.send_mail_morning(date_mail, nil, user)
        end
      end
    end
  end

  def get_event_log_day_night do
    get_users = Accounts.select_users()
    date_mail = Timex.format!(Timex.now("Asia/Ho_Chi_Minh"), "%d/%m/%Y", :strftime)

    if length(get_users) > 0 do
      for user <- get_users do
        get_data = EventLogs.list_event_days()
        if length(get_data) > 0 do
          %{nDateTime: min_date_unix} = Enum.min_by(get_data, fn x -> x.nDateTime end)
          %{nDateTime: max_date_unix} = Enum.max_by(get_data, fn x -> x.nDateTime end)

          if min_date_unix != max_date_unix do
            # Set info
            # min time
            min_date = Timex.from_unix(min_date_unix)
            min_time_format = Timex.format!(min_date, "%I:%M %p", :strftime)
            # max time
            max_date = Timex.from_unix(max_date_unix)
            max_time_format = Timex.format!(max_date, "%I:%M %p", :strftime)
            # send mail night
            SendMail.send_mail_night(date_mail, min_time_format, max_time_format, user)
          else
            # Set info
            # min time
            min_date = Timex.from_unix(min_date_unix)
            min_time_format = Timex.format!(min_date, "%I:%M %p", :strftime)
            #IO.inspect item.sUserName
            # send mail night
            SendMail.send_mail_night(date_mail, min_time_format, nil, user)
          end
        else
          SendMail.send_mail_night(date_mail, nil, nil, user)
        end
      end
    end
  end
end
