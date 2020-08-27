defmodule MyappWeb.CalendarController do
  use MyappWeb, :controller
  use Timex



  @week_start_at :mon


  defp day_names(:sun), do:  [7, 1, 2, 3, 4, 5, 6] |> Enum.map(&Timex.day_shortname/1)
  defp day_names(_), do:  [1, 2, 3, 4, 5, 6, 7] |> Enum.map(&Timex.day_shortname/1)

  def index(conn, _params) do
    current_date = Timex.now

    assigns = [
      current_date: current_date,
      day_names: day_names(@week_start_at),
      week_rows: week_rows(current_date)
    ]

    render(conn, "index.html", assigns)
  end

  # def render(assigns) do
  #   TutorialWeb.PageView.render("calendar.html", assigns)
  # end


  defp week_rows(current_date) do
    first =
      current_date
      |> Timex.beginning_of_month()
      |> Timex.beginning_of_week(@week_start_at)

    last =
      current_date
      |> Timex.end_of_month()
      |> Timex.end_of_week(@week_start_at)

    Interval.new(from: first, until: last)
    |> Enum.map(& &1)
    |> Enum.chunk_every(7)
  end

end
