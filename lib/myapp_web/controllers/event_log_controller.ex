defmodule MyappWeb.EventLogController do
  use MyappWeb, :controller

  alias Myapp.EventLogs
  # alias Myapp.EventLogs.EventLog

  def index(conn, _params) do
    eventlogs = EventLogs.list_eventlogs()
    render(conn, "index.html", eventlogs: eventlogs)
  end

  # def new(conn, _params) do
  #   changeset = EventLogs.change_event_log(%EventLog{})
  #   render(conn, "new.html", changeset: changeset)
  # end

  # def create(conn, %{"event_log" => event_log_params}) do
  #   case EventLogs.create_event_log(event_log_params) do
  #     {:ok, event_log} ->
  #       conn
  #       |> put_flash(:info, "Event log created successfully.")
  #       |> redirect(to: Routes.event_log_path(conn, :show, event_log))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "new.html", changeset: changeset)
  #   end
  # end

  def show(conn, _params) do
    event_log = EventLogs.get_event_log!()
    render(conn, "show.html", event_log: event_log)
  end

  # def edit(conn, %{"id" => id}) do
  #   event_log = EventLogs.get_event_log!(id)
  #   changeset = EventLogs.change_event_log(event_log)
  #   render(conn, "edit.html", event_log: event_log, changeset: changeset)
  # end

  # def update(conn, %{"id" => id, "event_log" => event_log_params}) do
  #   event_log = EventLogs.get_event_log!(id)

  #   case EventLogs.update_event_log(event_log, event_log_params) do
  #     {:ok, event_log} ->
  #       conn
  #       |> put_flash(:info, "Event log updated successfully.")
  #       |> redirect(to: Routes.event_log_path(conn, :show, event_log))

  #     {:error, %Ecto.Changeset{} = changeset} ->
  #       render(conn, "edit.html", event_log: event_log, changeset: changeset)
  #   end
  # end

  # def delete(conn, %{"id" => id}) do
  #   event_log = EventLogs.get_event_log!(id)
  #   {:ok, _event_log} = EventLogs.delete_event_log(event_log)

  #   conn
  #   |> put_flash(:info, "Event log deleted successfully.")
  #   |> redirect(to: Routes.event_log_path(conn, :index))
  # end
end
