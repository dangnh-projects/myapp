defmodule MyappWeb.CalendarController do
  use MyappWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end


end
