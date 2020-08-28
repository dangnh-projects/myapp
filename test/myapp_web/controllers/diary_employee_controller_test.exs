defmodule MyappWeb.DiaryEmployeeControllerTest do
  use MyappWeb.ConnCase

  alias Myapp.DiaryEmployees

  @create_attrs %{emp_Count: 42, emp_Table: "some emp_Table", emp_Updated: 42}
  @update_attrs %{emp_Count: 43, emp_Table: "some updated emp_Table", emp_Updated: 43}
  @invalid_attrs %{emp_Count: nil, emp_Table: nil, emp_Updated: nil}

  def fixture(:diary_employee) do
    {:ok, diary_employee} = DiaryEmployees.create_diary_employee(@create_attrs)
    diary_employee
  end

  describe "index" do
    test "lists all diary_employees", %{conn: conn} do
      conn = get(conn, Routes.diary_employee_path(conn, :index))
      assert html_response(conn, 200) =~ "Listing Diary employees"
    end
  end

  describe "new diary_employee" do
    test "renders form", %{conn: conn} do
      conn = get(conn, Routes.diary_employee_path(conn, :new))
      assert html_response(conn, 200) =~ "New Diary employee"
    end
  end

  describe "create diary_employee" do
    test "redirects to show when data is valid", %{conn: conn} do
      conn = post(conn, Routes.diary_employee_path(conn, :create), diary_employee: @create_attrs)

      assert %{id: id} = redirected_params(conn)
      assert redirected_to(conn) == Routes.diary_employee_path(conn, :show, id)

      conn = get(conn, Routes.diary_employee_path(conn, :show, id))
      assert html_response(conn, 200) =~ "Show Diary employee"
    end

    test "renders errors when data is invalid", %{conn: conn} do
      conn = post(conn, Routes.diary_employee_path(conn, :create), diary_employee: @invalid_attrs)
      assert html_response(conn, 200) =~ "New Diary employee"
    end
  end

  describe "edit diary_employee" do
    setup [:create_diary_employee]

    test "renders form for editing chosen diary_employee", %{conn: conn, diary_employee: diary_employee} do
      conn = get(conn, Routes.diary_employee_path(conn, :edit, diary_employee))
      assert html_response(conn, 200) =~ "Edit Diary employee"
    end
  end

  describe "update diary_employee" do
    setup [:create_diary_employee]

    test "redirects when data is valid", %{conn: conn, diary_employee: diary_employee} do
      conn = put(conn, Routes.diary_employee_path(conn, :update, diary_employee), diary_employee: @update_attrs)
      assert redirected_to(conn) == Routes.diary_employee_path(conn, :show, diary_employee)

      conn = get(conn, Routes.diary_employee_path(conn, :show, diary_employee))
      assert html_response(conn, 200) =~ "some updated emp_Table"
    end

    test "renders errors when data is invalid", %{conn: conn, diary_employee: diary_employee} do
      conn = put(conn, Routes.diary_employee_path(conn, :update, diary_employee), diary_employee: @invalid_attrs)
      assert html_response(conn, 200) =~ "Edit Diary employee"
    end
  end

  describe "delete diary_employee" do
    setup [:create_diary_employee]

    test "deletes chosen diary_employee", %{conn: conn, diary_employee: diary_employee} do
      conn = delete(conn, Routes.diary_employee_path(conn, :delete, diary_employee))
      assert redirected_to(conn) == Routes.diary_employee_path(conn, :index)
      assert_error_sent 404, fn ->
        get(conn, Routes.diary_employee_path(conn, :show, diary_employee))
      end
    end
  end

  defp create_diary_employee(_) do
    diary_employee = fixture(:diary_employee)
    %{diary_employee: diary_employee}
  end
end
