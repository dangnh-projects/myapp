defmodule Myapp.EventLogsTest do
  use Myapp.DataCase

  alias Myapp.EventLogs

  describe "eventlogs" do
    alias Myapp.EventLogs.EventLog

    @valid_attrs %{nDateTime: 42, nEventIdn: 42, nEventLogIdn: 42, nIsLog: 42, nReaderIdn: 42, nUserID: 42}
    @update_attrs %{nDateTime: 43, nEventIdn: 43, nEventLogIdn: 43, nIsLog: 43, nReaderIdn: 43, nUserID: 43}
    @invalid_attrs %{nDateTime: nil, nEventIdn: nil, nEventLogIdn: nil, nIsLog: nil, nReaderIdn: nil, nUserID: nil}

    def event_log_fixture(attrs \\ %{}) do
      {:ok, event_log} =
        attrs
        |> Enum.into(@valid_attrs)
        |> EventLogs.create_event_log()

      event_log
    end

    test "list_eventlogs/0 returns all eventlogs" do
      event_log = event_log_fixture()
      assert EventLogs.list_eventlogs() == [event_log]
    end

    test "get_event_log!/1 returns the event_log with given id" do
      event_log = event_log_fixture()
      assert EventLogs.get_event_log!(event_log.id) == event_log
    end

    test "create_event_log/1 with valid data creates a event_log" do
      assert {:ok, %EventLog{} = event_log} = EventLogs.create_event_log(@valid_attrs)
      assert event_log.nDateTime == 42
      assert event_log.nEventIdn == 42
      assert event_log.nEventLogIdn == 42
      assert event_log.nIsLog == 42
      assert event_log.nReaderIdn == 42
      assert event_log.nUserID == 42
    end

    test "create_event_log/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = EventLogs.create_event_log(@invalid_attrs)
    end

    test "update_event_log/2 with valid data updates the event_log" do
      event_log = event_log_fixture()
      assert {:ok, %EventLog{} = event_log} = EventLogs.update_event_log(event_log, @update_attrs)
      assert event_log.nDateTime == 43
      assert event_log.nEventIdn == 43
      assert event_log.nEventLogIdn == 43
      assert event_log.nIsLog == 43
      assert event_log.nReaderIdn == 43
      assert event_log.nUserID == 43
    end

    test "update_event_log/2 with invalid data returns error changeset" do
      event_log = event_log_fixture()
      assert {:error, %Ecto.Changeset{}} = EventLogs.update_event_log(event_log, @invalid_attrs)
      assert event_log == EventLogs.get_event_log!(event_log.id)
    end

    test "delete_event_log/1 deletes the event_log" do
      event_log = event_log_fixture()
      assert {:ok, %EventLog{}} = EventLogs.delete_event_log(event_log)
      assert_raise Ecto.NoResultsError, fn -> EventLogs.get_event_log!(event_log.id) end
    end

    test "change_event_log/1 returns a event_log changeset" do
      event_log = event_log_fixture()
      assert %Ecto.Changeset{} = EventLogs.change_event_log(event_log)
    end
  end
end
