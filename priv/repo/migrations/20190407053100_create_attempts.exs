defmodule Mathmatical.Repo.Migrations.CreateAttempts do
  use Ecto.Migration

  def change do
    create table(:attempts) do
      add :date, :date
      add :streak, :integer

      timestamps()
    end

  end
end
