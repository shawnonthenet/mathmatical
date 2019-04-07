defmodule Mathmatical.Runs.Attempt do
  use Ecto.Schema
  import Ecto.Changeset

  schema "attempts" do
    field :date, :date
    field :streak, :integer

    timestamps()
  end

  @doc false
  def changeset(attempt, attrs) do
    attempt
    |> cast(attrs, [:date, :streak])
    |> validate_required([:date, :streak])
  end
end
