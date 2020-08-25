defmodule Myapp.AccountsTest do
  use Myapp.DataCase

  alias Myapp.Accounts

  describe "users" do
    alias Myapp.Accounts.User

    @valid_attrs %{nDepartmentIdn: 42, nEndDate: 42, nStartDate: 42, sEmail: "some sEmail", sTelNumber: "some sTelNumber", sUserID: "some sUserID", sUserName: "some sUserName"}
    @update_attrs %{nDepartmentIdn: 43, nEndDate: 43, nStartDate: 43, sEmail: "some updated sEmail", sTelNumber: "some updated sTelNumber", sUserID: "some updated sUserID", sUserName: "some updated sUserName"}
    @invalid_attrs %{nDepartmentIdn: nil, nEndDate: nil, nStartDate: nil, sEmail: nil, sTelNumber: nil, sUserID: nil, sUserName: nil}

    def user_fixture(attrs \\ %{}) do
      {:ok, user} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Accounts.create_user()

      user
    end

    test "list_users/0 returns all users" do
      user = user_fixture()
      assert Accounts.list_users() == [user]
    end

    test "get_user!/1 returns the user with given id" do
      user = user_fixture()
      assert Accounts.get_user!(user.id) == user
    end

    test "create_user/1 with valid data creates a user" do
      assert {:ok, %User{} = user} = Accounts.create_user(@valid_attrs)
      assert user.nDepartmentIdn == 42
      assert user.nEndDate == 42
      assert user.nStartDate == 42
      assert user.sEmail == "some sEmail"
      assert user.sTelNumber == "some sTelNumber"
      assert user.sUserID == "some sUserID"
      assert user.sUserName == "some sUserName"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, %User{} = user} = Accounts.update_user(user, @update_attrs)
      assert user.nDepartmentIdn == 43
      assert user.nEndDate == 43
      assert user.nStartDate == 43
      assert user.sEmail == "some updated sEmail"
      assert user.sTelNumber == "some updated sTelNumber"
      assert user.sUserID == "some updated sUserID"
      assert user.sUserName == "some updated sUserName"
    end

    test "update_user/2 with invalid data returns error changeset" do
      user = user_fixture()
      assert {:error, %Ecto.Changeset{}} = Accounts.update_user(user, @invalid_attrs)
      assert user == Accounts.get_user!(user.id)
    end

    test "delete_user/1 deletes the user" do
      user = user_fixture()
      assert {:ok, %User{}} = Accounts.delete_user(user)
      assert_raise Ecto.NoResultsError, fn -> Accounts.get_user!(user.id) end
    end

    test "change_user/1 returns a user changeset" do
      user = user_fixture()
      assert %Ecto.Changeset{} = Accounts.change_user(user)
    end
  end
end
