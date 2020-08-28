defmodule Myapp.WorkingUsers.User do
  use Ecto.Schema
  import Ecto.Changeset

  @primary_key false
  schema "tb_users" do
    field :sUserID, :string, primary_key: true
    field :nDepartmentIdn, :integer
    field :nEndDate, :integer
    field :nStartDate, :integer
    field :sEmail, :string
    field :sTelNumber, :string
    field :sUserName, :string
    field :nUserIdn, :integer

    #timestamps()
  end

  @doc false
  def changeset(employee, attrs) do
    employee
    |> cast(attrs, [:nUserIdn, :sUserName, :nDepartmentIdn, :sTelNumber, :sEmail, :sUserID, :nStartDate, :nEndDate])
    |> validate_required([:sUserName, :nDepartmentIdn, :sUserID, :nUserIdn])
  end
end
