defmodule Mathmatical.Repo.Migrations.CreateSubjects do
  use Ecto.Migration

  def change do
    create table(:subjects) do
      add :name, :string

      timestamps()
    end

  end
end
