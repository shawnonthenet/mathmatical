defmodule Mathmatical.Runs do
  @moduledoc """
  The Runs context.
  """

  import Ecto.Query, warn: false
  alias Mathmatical.Repo

  alias Mathmatical.Runs.Attempt

  @doc """
  Returns the list of attempts.

  ## Examples

      iex> list_attempts()
      [%Attempt{}, ...]

  """
  def list_attempts do
    Repo.all(Attempt)
  end

  @doc """
  Gets a single attempt.

  Raises `Ecto.NoResultsError` if the Attempt does not exist.

  ## Examples

      iex> get_attempt!(123)
      %Attempt{}

      iex> get_attempt!(456)
      ** (Ecto.NoResultsError)

  """
  def get_attempt!(id), do: Repo.get!(Attempt, id)

  @doc """
  Creates a attempt.

  ## Examples

      iex> create_attempt(%{field: value})
      {:ok, %Attempt{}}

      iex> create_attempt(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_attempt(attrs \\ %{}) do
    %Attempt{}
    |> Attempt.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a attempt.

  ## Examples

      iex> update_attempt(attempt, %{field: new_value})
      {:ok, %Attempt{}}

      iex> update_attempt(attempt, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_attempt(%Attempt{} = attempt, attrs) do
    attempt
    |> Attempt.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Attempt.

  ## Examples

      iex> delete_attempt(attempt)
      {:ok, %Attempt{}}

      iex> delete_attempt(attempt)
      {:error, %Ecto.Changeset{}}

  """
  def delete_attempt(%Attempt{} = attempt) do
    Repo.delete(attempt)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking attempt changes.

  ## Examples

      iex> change_attempt(attempt)
      %Ecto.Changeset{source: %Attempt{}}

  """
  def change_attempt(%Attempt{} = attempt) do
    Attempt.changeset(attempt, %{})
  end

  alias Mathmatical.Runs.Result

  @doc """
  Returns the list of results.

  ## Examples

      iex> list_results()
      [%Result{}, ...]

  """
  def list_results do
    Repo.all(Result)
  end

  @doc """
  Gets a single result.

  Raises `Ecto.NoResultsError` if the Result does not exist.

  ## Examples

      iex> get_result!(123)
      %Result{}

      iex> get_result!(456)
      ** (Ecto.NoResultsError)

  """
  def get_result!(id), do: Repo.get!(Result, id)

  @doc """
  Creates a result.

  ## Examples

      iex> create_result(%{field: value})
      {:ok, %Result{}}

      iex> create_result(%{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def create_result(attrs \\ %{}) do
    %Result{}
    |> Result.changeset(attrs)
    |> Repo.insert()
  end

  @doc """
  Updates a result.

  ## Examples

      iex> update_result(result, %{field: new_value})
      {:ok, %Result{}}

      iex> update_result(result, %{field: bad_value})
      {:error, %Ecto.Changeset{}}

  """
  def update_result(%Result{} = result, attrs) do
    result
    |> Result.changeset(attrs)
    |> Repo.update()
  end

  @doc """
  Deletes a Result.

  ## Examples

      iex> delete_result(result)
      {:ok, %Result{}}

      iex> delete_result(result)
      {:error, %Ecto.Changeset{}}

  """
  def delete_result(%Result{} = result) do
    Repo.delete(result)
  end

  @doc """
  Returns an `%Ecto.Changeset{}` for tracking result changes.

  ## Examples

      iex> change_result(result)
      %Ecto.Changeset{source: %Result{}}

  """
  def change_result(%Result{} = result) do
    Result.changeset(result, %{})
  end
end
