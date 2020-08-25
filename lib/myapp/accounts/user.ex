defmodule Myapp.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "tb_user" do
    field :sUserID, :string, primary_key: true
    field :nDepartmentIdn, :integer
    field :nEndDate, :integer
    field :nStartDate, :integer
    field :sEmail, :string
    field :sTelNumber, :string
    field :sUserName, :string

    #timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:sUserName, :nDepartmentIdn, :sTelNumber, :sEmail, :sUserID, :nStartDate, :nEndDate])
    |> validate_required([:sUserName, :nDepartmentIdn, :sUserID])
  end
end
