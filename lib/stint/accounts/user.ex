defmodule Stint.Accounts.User do
  use Ecto.Schema
  import Ecto.Changeset


  schema "users" do
    field :default_workspace_id, :integer
    field :email, :string
    field :toggl_api_token, :string
    field :tempo_api_key, :string
    field :tempo_username, :string

    timestamps()
  end

  @doc false
  def changeset(user, attrs) do
    user
    |> cast(attrs, [:email, :default_workspace_id, :toggl_api_token])
    |> validate_required([:email, :default_workspace_id, :toggl_api_token])
    |> unique_constraint(:email)
  end

  def tempo_changeset(user, attrs) do
    user
    |> changeset(attrs)
    |> cast(attrs, [:tempo_api_key, :tempo_username])
    |> validate_required([:tempo_api_key, :tempo_username])
  end

end
