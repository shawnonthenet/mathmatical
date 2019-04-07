defmodule Mathmatical.Questions.Question do
  use Ecto.Schema
  import Ecto.Changeset

  schema "questions" do
    field :answer, :string
    field :question, :string
    field :subject_id, :id

    timestamps()
  end

  @doc false
  def changeset(question, attrs) do
    question
    |> cast(attrs, [:question, :answer])
    |> validate_required([:question, :answer])
  end
end
