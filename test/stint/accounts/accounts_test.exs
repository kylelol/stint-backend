defmodule Stint.AccountsTest do
  use Stint.DataCase

  alias Stint.Accounts

  describe "users" do
    alias Stint.Accounts.User

    @valid_attrs %{default_workspace_id: 42, email: "some email", toggl_api_token: "some toggl_api_token"}
    @update_attrs %{default_workspace_id: 43, email: "some updated email", toggl_api_token: "some updated toggl_api_token"}
    @invalid_attrs %{default_workspace_id: nil, email: nil, toggl_api_token: nil}

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
      assert user.default_workspace_id == 42
      assert user.email == "some email"
      assert user.toggl_api_token == "some toggl_api_token"
    end

    test "create_user/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Accounts.create_user(@invalid_attrs)
    end

    test "update_user/2 with valid data updates the user" do
      user = user_fixture()
      assert {:ok, user} = Accounts.update_user(user, @update_attrs)
      assert %User{} = user
      assert user.default_workspace_id == 43
      assert user.email == "some updated email"
      assert user.toggl_api_token == "some updated toggl_api_token"
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
