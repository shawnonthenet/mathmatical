defmodule Mathmatical.Runs.Result do
  use Ecto.Schema
  import Ecto.Changeset

  schema "results" do
    field :answer_given, :string
    field :correct, :boolean, default: false
    field :attempt_id, :id
    field :question_id, :id

    timestamps()
  end

  @doc false
  def changeset(result, attrs) do
    result
    |> cast(attrs, [:answer_given, :correct])
    |> validate_required([:answer_given, :correct])
  end
end
