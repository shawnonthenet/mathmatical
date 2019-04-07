defmodule Mathmatical.Repo.Migrations.CreateResults do
  use Ecto.Migration

  def change do
    create table(:results) do
      add :answer_given, :text
      add :correct, :boolean, default: false, null: false
      add :attempt_id, references(:attempts, on_delete: :nothing)
      add :question_id, references(:questions, on_delete: :nothing)

      timestamps()
    end

    create index(:results, [:attempt_id])
    create index(:results, [:question_id])
  end
end
