defmodule Stint.Repo.Migrations.CreateUsers do
  use Ecto.Migration

  def change do
    execute("CREATE EXTENSION citext;")

    create table(:users) do
      add :email, :citext
      add :default_workspace_id, :integer
      add :toggl_api_token, :string

      timestamps()
    end

    create unique_index(:users, [:email])
  end
end
