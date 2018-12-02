defmodule Stint.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :default_workspace_id, :integer
    field :email, :string
    field :toggl_api_token, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :default_workspace_id, :toggl_api_token])
    |> validate_required([:email, :default_workspace_id, :toggl_api_token])
    |> unique_constraint(:email)
  end
end
