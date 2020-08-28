defmodule Myapp.GetLogEmplyee do
  alias Myapp.DiaryEmployees
  alias Myapp.WorkingUsers.User
  alias Myapp.Accounts
  alias Myapp.RepoWork
  alias Timex
  # alias Myapp.WorkingUsers

  # Myapp.GetLogEmplyee.get_employee_change
  def get_employee_change do
    get_diary =
      case DiaryEmployees.diary_employee_last do
        nil -> Accounts.sync_all_employees()
        nk -> Accounts.sync_get_employees(nk.emp_Updated)
      end

    length_employees = length(get_diary)

    if length_employees > 0 do
      get_diary =
				for item <- get_diary do
          Map.drop(item, [:__meta__, :__struct__])
        end

      insert_record(get_diary, length_employees)

      #list_100_records = Enum.fetch(get_diary, 99)
      #IO.inspect list_100_records
      #IO.inspect length(list_100_records)

      # for item <- get_diary do
      #   IO.inspect item
      #   WorkingUsers.create_user(item)
      # end

      #result = RepoWork.insert_all(User, get_diary)
      #IO.inspect get_diary
    end
  end

  def insert_record(records, length_employees) when length_employees > 100 do
    list_insert_records = Enum.take(records, 100)
    list_left_records = Enum.take(records, 100-length_employees)
    leght_left_records = length(list_left_records)

    {count_records, _} = RepoWork.insert_all(User, list_insert_records)
    IO.inspect count_records

    if leght_left_records > 0, do: insert_record(list_left_records, leght_left_records)
  end

  def insert_record(records, length_employees) when length_employees < 101 do
    %{nUserIdn: max_id} = Enum.max_by(records, fn x -> x.nUserIdn end)
    {count_records, _} = RepoWork.insert_all(User, records)
    IO.inspect count_records

    result = DiaryEmployees.create_diary_employee(%{emp_Table: "log_tb_users", emp_Updated: max_id, emp_Count: count_records})

    IO.inspect result
  end
end
