defmodule Stint.Repo.Migrations.AddTempoApiKeyToUsers do
  use Ecto.Migration

  def change do
    alter table(:users) do
      add :tempo_api_key, :string
    end
  end

end
