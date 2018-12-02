defmodule Stint.Repo.Migrations.AddUsernameToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :tempo_username, :string
    end
  end
end
