defmodule Myapp.EventLogs do
  @moduledoc """
  The EventLogs context.
  """

  import Ecto.Query, warn: false

  alias Timex
  alias Myapp.RepoBio
  alias Myapp.EventLogs.EventLog

  @doc """
  Returns the list of eventlogs.

  ## Examples

      iex> list_eventlogs()
      [%EventLog{}, ...]

  """
  def list_eventlogs do
    # query =
    #   EventLog
    #   |> where([e], e.nUserID == 1452)
    #   #|> order_by([u], [asc: u.sUserID])
    # RepoBio.all(query)
    today = Timex.now()
    start_date_unix = Timex.to_unix(Timex.beginning_of_day(today))
    end_date_unix = Timex.to_unix(Timex.end_of_day(today))
    # {:ok, datetime} = DateTime.from_unix(users.nEndDate)
    # unix_time = DateTime.to_unix(datetime)
    # date_mail = Timex.format!(datetime, "%d/%m/%Y", :strftime)

    query =
      EventLog
      |> where([e], ^start_date_unix < e.nDateTime and e.nDateTime < ^end_date_unix)
      #|> where([e], e.nUserID == 1452)
      |> where([e], e.nEventIdn == 55)
      #|> order_by([u], [asc: u.sUserID])
    RepoBio.all(query)
  end

  def list_event_days do
    today = Timex.now()
    start_date_unix = Timex.to_unix(Timex.beginning_of_day(today))
    end_date_unix = start_date_unix + 86400

    query =
      EventLog
      |> where([e], ^start_date_unix < e.nDateTime and e.nDateTime < ^end_date_unix)
      |> where([e], e.nUserID == 1452)
      |> where([e], 34 < e.nEventIdn and e.nEventIdn < 63)
    RepoBio.all(query)

  end

  @doc """
  Gets a single event_log.

  Raises `Ecto.NoResultsError` if the Event log does not exist.

  ## Examples

      iex> get_event_log!(123)
      %EventLog{}

      iex> get_event_log!(456)
      ** (Ecto.NoResultsError)

  """
  def get_event_log!(), do: RepoBio.get!(EventLog, 11429908)

  @doc """
  Creates a event_log.

  ## Examples

      iex> create_event_log(%{field: value})
      {:ok, %EventLog{}}

      iex> create_event_log(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # def create_event_log(attrs \\ %{}) do
  #   %EventLog{}
  #   |> EventLog.changeset(attrs)
  #   |> RepoBio.insert()
  # end

  @doc """
  Updates a event_log.

  ## Examples

      iex> update_event_log(event_log, %{field: new_value})
      {:ok, %EventLog{}}

      iex> update_event_log(event_log, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # def update_event_log(%EventLog{} = event_log, attrs) do
  #   event_log
  #   |> EventLog.changeset(attrs)
  #   |> RepoBio.update()
  # end

  @doc """
  Deletes a event_log.

  ## Examples

      iex> delete_event_log(event_log)
      {:ok, %EventLog{}}

      iex> delete_event_log(event_log)
      {:error, %Ecto.Changeset{}}

  """
  # def delete_event_log(%EventLog{} = event_log) do
  #   RepoBio.delete(event_log)
  # end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking event_log changes.

  ## Examples

      iex> change_event_log(event_log)
      %Ecto.Changeset{data: %EventLog{}}

  """
  def change_event_log(%EventLog{} = event_log, attrs \\ %{}) do
    EventLog.changeset(event_log, attrs)
  end
end
