defmodule Myapp.EventLogs.EventLog do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "tb_event_log" do
    field :nEventLogIdn, :integer, primary_key: true
    field :nDateTime, :integer
    field :nEventIdn, :integer
    field :nIsLog, :integer
    field :nReaderIdn, :integer
    field :nUserID, :integer
  end

  @doc false
  def changeset(event_log, attrs) do
    event_log
    |> cast(attrs, [:nEventLogIdn, :nDateTime, :nReaderIdn, :nEventIdn, :nUserID, :nIsLog])
    |> validate_required([:nEventLogIdn, :nDateTime, :nReaderIdn, :nEventIdn, :nUserID])
  end
end
