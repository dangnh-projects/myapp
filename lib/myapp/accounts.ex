defmodule Myapp.Accounts do
  @moduledoc """
  The Accounts context.
  """

  import Ecto.Query, warn: false
  alias Myapp.RepoBio
  alias Myapp.Accounts.User

  @doc """
  Returns the list of users.

  ## Examples

      iex> list_users()
      [%User{}, ...]

  """
  # def list_users do
  #   RepoBio.all(User)
  # end

    def list_users do
      query =
        User
        |> where([u], u.sEmail != "" and not(is_nil(u.sEmail)))
        |> order_by([u], [asc: u.sUserID])

      RepoBio.all(query)
    end

    def select_users do
      query =
        User
        |> where([u], u.sEmail != "" and not(is_nil(u.sEmail)) and u.sUserID == "1452")
        #|> order_by([u], [asc: u.sUserID])

      RepoBio.all(query)
    end

    def get_user!(), do: RepoBio.get!(User, "1452")

  @doc """
  Gets a single user.

  Raises `Ecto.NoResultsError` if the User does not exist.

  ## Examples

      iex> get_user!(123)
      %User{}

      iex> get_user!(456)
      ** (Ecto.NoResultsError)

  """
  #def get_user!(sUserID), do: RepoBio.get!(User, sUserID)

  @doc """
  Creates a user.

  ## Examples

      iex> create_user(%{field: value})
      {:ok, %User{}}

      iex> create_user(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # def create_user(attrs \\ %{}) do
  #   %User{}
  #   |> User.changeset(attrs)
  #   |> RepoBio.insert()
  # end

  @doc """
  Updates a user.

  ## Examples

      iex> update_user(user, %{field: new_value})
      {:ok, %User{}}

      iex> update_user(user, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  # def update_user(%User{} = user, attrs) do
  #   user
  #   |> User.changeset(attrs)
  #   |> RepoBio.update()
  # end

  @doc """
  Deletes a user.

  ## Examples

      iex> delete_user(user)
      {:ok, %User{}}

      iex> delete_user(user)
      {:error, %Ecto.Changeset{}}

  """
  # def delete_user(%User{} = user) do
  #   RepoBio.delete(user)
  # end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking user changes.

  ## Examples

      iex> change_user(user)
      %Ecto.Changeset{data: %User{}}

  """
  # def change_user(%User{} = user, attrs \\ %{}) do
  #   User.changeset(user, attrs)
  # end
end
