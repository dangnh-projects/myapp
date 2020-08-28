defmodule Myapp.DiaryEmployees do
  @moduledoc """
  The DiaryEmployees context.
  """

  import Ecto.Query, warn: false
  alias Myapp.RepoWork

  alias Myapp.DiaryEmployees.DiaryEmployee

  @doc """
  Returns the list of diary_employees.

  ## Examples

      iex> list_diary_employees()
      [%DiaryEmployee{}, ...]

  """
  def list_diary_employees do
    RepoWork.all(DiaryEmployee)
  end

  @doc """
  Gets a single diary_employee.

  Raises `Ecto.NoResultsError` if the Diary employee does not exist.

  ## Examples

      iex> get_diary_employee!(123)
      %DiaryEmployee{}

      iex> get_diary_employee!(456)
      ** (Ecto.NoResultsError)

  """
  def get_diary_employee!(id), do: RepoWork.get!(DiaryEmployee, id)

  @doc """
  Creates a diary_employee.

  ## Examples

      iex> create_diary_employee(%{field: value})
      {:ok, %DiaryEmployee{}}

      iex> create_diary_employee(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_diary_employee(attrs \\ %{}) do
    %DiaryEmployee{}
    |> DiaryEmployee.changeset(attrs)
    |> RepoWork.insert()
  end

  @doc """
  Updates a diary_employee.

  ## Examples

      iex> update_diary_employee(diary_employee, %{field: new_value})
      {:ok, %DiaryEmployee{}}

      iex> update_diary_employee(diary_employee, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_diary_employee(%DiaryEmployee{} = diary_employee, attrs) do
    diary_employee
    |> DiaryEmployee.changeset(attrs)
    |> RepoWork.update()
  end

  @doc """
  Deletes a diary_employee.

  ## Examples

      iex> delete_diary_employee(diary_employee)
      {:ok, %DiaryEmployee{}}

      iex> delete_diary_employee(diary_employee)
      {:error, %Ecto.Changeset{}}

  """
  def delete_diary_employee(%DiaryEmployee{} = diary_employee) do
    RepoWork.delete(diary_employee)
  end

  def diary_employee_last do
    DiaryEmployee
    |> last
    |> RepoWork.one
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking diary_employee changes.

  ## Examples

      iex> change_diary_employee(diary_employee)
      %Ecto.Changeset{data: %DiaryEmployee{}}

  """
  def change_diary_employee(%DiaryEmployee{} = diary_employee, attrs \\ %{}) do
    DiaryEmployee.changeset(diary_employee, attrs)
  end
end
