defmodule MyappWeb.DiaryEmployeeController do
  use MyappWeb, :controller

  alias Myapp.DiaryEmployees
  alias Myapp.DiaryEmployees.DiaryEmployee

  def index(conn, _params) do
    diary_employees = DiaryEmployees.list_diary_employees()
    render(conn, "index.html", diary_employees: diary_employees)
  end

  def new(conn, _params) do
    changeset = DiaryEmployees.change_diary_employee(%DiaryEmployee{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"diary_employee" => diary_employee_params}) do
    case DiaryEmployees.create_diary_employee(diary_employee_params) do
      {:ok, diary_employee} ->
        conn
        |> put_flash(:info, "Diary employee created successfully.")
        |> redirect(to: Routes.diary_employee_path(conn, :show, diary_employee))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    diary_employee = DiaryEmployees.get_diary_employee!(id)
    render(conn, "show.html", diary_employee: diary_employee)
  end

  def edit(conn, %{"id" => id}) do
    diary_employee = DiaryEmployees.get_diary_employee!(id)
    changeset = DiaryEmployees.change_diary_employee(diary_employee)
    render(conn, "edit.html", diary_employee: diary_employee, changeset: changeset)
  end

  def update(conn, %{"id" => id, "diary_employee" => diary_employee_params}) do
    diary_employee = DiaryEmployees.get_diary_employee!(id)

    case DiaryEmployees.update_diary_employee(diary_employee, diary_employee_params) do
      {:ok, diary_employee} ->
        conn
        |> put_flash(:info, "Diary employee updated successfully.")
        |> redirect(to: Routes.diary_employee_path(conn, :show, diary_employee))

      {:error, %Ecto.Changeset{} = changeset} ->
        render(conn, "edit.html", diary_employee: diary_employee, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    diary_employee = DiaryEmployees.get_diary_employee!(id)
    {:ok, _diary_employee} = DiaryEmployees.delete_diary_employee(diary_employee)

    conn
    |> put_flash(:info, "Diary employee deleted successfully.")
    |> redirect(to: Routes.diary_employee_path(conn, :index))
  end
end
