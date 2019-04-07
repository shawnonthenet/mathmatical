defmodule Mathmatical.Repo.Migrations.CreateQuestions do
  use Ecto.Migration

  def change do
    create table(:questions) do
      add :question, :text
      add :answer, :text
      add :subject_id, references(:subjects, on_delete: :nothing)

      timestamps()
    end

    create index(:questions, [:subject_id])
  end
end
