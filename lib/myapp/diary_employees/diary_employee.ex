defmodule Myapp.DiaryEmployees.DiaryEmployee do
  use Ecto.Schema
  import Ecto.Changeset

  schema "diary_employees" do
    field :emp_Count, :integer
    field :emp_Table, :string
    field :emp_Updated, :integer

    timestamps()
  end

  @doc false
  def changeset(diary_employee, attrs) do
    diary_employee
    |> cast(attrs, [:emp_Updated, :emp_Table, :emp_Count])
    |> validate_required([:emp_Updated, :emp_Table, :emp_Count])
  end
end
