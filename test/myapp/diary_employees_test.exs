defmodule Myapp.DiaryEmployeesTest do
  use Myapp.DataCase

  alias Myapp.DiaryEmployees

  describe "diary_employees" do
    alias Myapp.DiaryEmployees.DiaryEmployee

    @valid_attrs %{emp_Count: 42, emp_Table: "some emp_Table", emp_Updated: 42}
    @update_attrs %{emp_Count: 43, emp_Table: "some updated emp_Table", emp_Updated: 43}
    @invalid_attrs %{emp_Count: nil, emp_Table: nil, emp_Updated: nil}

    def diary_employee_fixture(attrs \\ %{}) do
      {:ok, diary_employee} =
        attrs
        |> Enum.into(@valid_attrs)
        |> DiaryEmployees.create_diary_employee()

      diary_employee
    end

    test "list_diary_employees/0 returns all diary_employees" do
      diary_employee = diary_employee_fixture()
      assert DiaryEmployees.list_diary_employees() == [diary_employee]
    end

    test "get_diary_employee!/1 returns the diary_employee with given id" do
      diary_employee = diary_employee_fixture()
      assert DiaryEmployees.get_diary_employee!(diary_employee.id) == diary_employee
    end

    test "create_diary_employee/1 with valid data creates a diary_employee" do
      assert {:ok, %DiaryEmployee{} = diary_employee} = DiaryEmployees.create_diary_employee(@valid_attrs)
      assert diary_employee.emp_Count == 42
      assert diary_employee.emp_Table == "some emp_Table"
      assert diary_employee.emp_Updated == 42
    end

    test "create_diary_employee/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = DiaryEmployees.create_diary_employee(@invalid_attrs)
    end

    test "update_diary_employee/2 with valid data updates the diary_employee" do
      diary_employee = diary_employee_fixture()
      assert {:ok, %DiaryEmployee{} = diary_employee} = DiaryEmployees.update_diary_employee(diary_employee, @update_attrs)
      assert diary_employee.emp_Count == 43
      assert diary_employee.emp_Table == "some updated emp_Table"
      assert diary_employee.emp_Updated == 43
    end

    test "update_diary_employee/2 with invalid data returns error changeset" do
      diary_employee = diary_employee_fixture()
      assert {:error, %Ecto.Changeset{}} = DiaryEmployees.update_diary_employee(diary_employee, @invalid_attrs)
      assert diary_employee == DiaryEmployees.get_diary_employee!(diary_employee.id)
    end

    test "delete_diary_employee/1 deletes the diary_employee" do
      diary_employee = diary_employee_fixture()
      assert {:ok, %DiaryEmployee{}} = DiaryEmployees.delete_diary_employee(diary_employee)
      assert_raise Ecto.NoResultsError, fn -> DiaryEmployees.get_diary_employee!(diary_employee.id) end
    end

    test "change_diary_employee/1 returns a diary_employee changeset" do
      diary_employee = diary_employee_fixture()
      assert %Ecto.Changeset{} = DiaryEmployees.change_diary_employee(diary_employee)
    end
  end
end
