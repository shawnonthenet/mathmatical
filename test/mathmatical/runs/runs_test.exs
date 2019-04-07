defmodule Mathmatical.RunsTest do
  use Mathmatical.DataCase

  alias Mathmatical.Runs

  describe "attempts" do
    alias Mathmatical.Runs.Attempt

    @valid_attrs %{date: ~D[2010-04-17], streak: 42}
    @update_attrs %{date: ~D[2011-05-18], streak: 43}
    @invalid_attrs %{date: nil, streak: nil}

    def attempt_fixture(attrs \\ %{}) do
      {:ok, attempt} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Runs.create_attempt()

      attempt
    end

    test "list_attempts/0 returns all attempts" do
      attempt = attempt_fixture()
      assert Runs.list_attempts() == [attempt]
    end

    test "get_attempt!/1 returns the attempt with given id" do
      attempt = attempt_fixture()
      assert Runs.get_attempt!(attempt.id) == attempt
    end

    test "create_attempt/1 with valid data creates a attempt" do
      assert {:ok, %Attempt{} = attempt} = Runs.create_attempt(@valid_attrs)
      assert attempt.date == ~D[2010-04-17]
      assert attempt.streak == 42
    end

    test "create_attempt/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Runs.create_attempt(@invalid_attrs)
    end

    test "update_attempt/2 with valid data updates the attempt" do
      attempt = attempt_fixture()
      assert {:ok, %Attempt{} = attempt} = Runs.update_attempt(attempt, @update_attrs)
      assert attempt.date == ~D[2011-05-18]
      assert attempt.streak == 43
    end

    test "update_attempt/2 with invalid data returns error changeset" do
      attempt = attempt_fixture()
      assert {:error, %Ecto.Changeset{}} = Runs.update_attempt(attempt, @invalid_attrs)
      assert attempt == Runs.get_attempt!(attempt.id)
    end

    test "delete_attempt/1 deletes the attempt" do
      attempt = attempt_fixture()
      assert {:ok, %Attempt{}} = Runs.delete_attempt(attempt)
      assert_raise Ecto.NoResultsError, fn -> Runs.get_attempt!(attempt.id) end
    end

    test "change_attempt/1 returns a attempt changeset" do
      attempt = attempt_fixture()
      assert %Ecto.Changeset{} = Runs.change_attempt(attempt)
    end
  end

  describe "results" do
    alias Mathmatical.Runs.Result

    @valid_attrs %{answer_given: "some answer_given", correct: true}
    @update_attrs %{answer_given: "some updated answer_given", correct: false}
    @invalid_attrs %{answer_given: nil, correct: nil}

    def result_fixture(attrs \\ %{}) do
      {:ok, result} =
        attrs
        |> Enum.into(@valid_attrs)
        |> Runs.create_result()

      result
    end

    test "list_results/0 returns all results" do
      result = result_fixture()
      assert Runs.list_results() == [result]
    end

    test "get_result!/1 returns the result with given id" do
      result = result_fixture()
      assert Runs.get_result!(result.id) == result
    end

    test "create_result/1 with valid data creates a result" do
      assert {:ok, %Result{} = result} = Runs.create_result(@valid_attrs)
      assert result.answer_given == "some answer_given"
      assert result.correct == true
    end

    test "create_result/1 with invalid data returns error changeset" do
      assert {:error, %Ecto.Changeset{}} = Runs.create_result(@invalid_attrs)
    end

    test "update_result/2 with valid data updates the result" do
      result = result_fixture()
      assert {:ok, %Result{} = result} = Runs.update_result(result, @update_attrs)
      assert result.answer_given == "some updated answer_given"
      assert result.correct == false
    end

    test "update_result/2 with invalid data returns error changeset" do
      result = result_fixture()
      assert {:error, %Ecto.Changeset{}} = Runs.update_result(result, @invalid_attrs)
      assert result == Runs.get_result!(result.id)
    end

    test "delete_result/1 deletes the result" do
      result = result_fixture()
      assert {:ok, %Result{}} = Runs.delete_result(result)
      assert_raise Ecto.NoResultsError, fn -> Runs.get_result!(result.id) end
    end

    test "change_result/1 returns a result changeset" do
      result = result_fixture()
      assert %Ecto.Changeset{} = Runs.change_result(result)
    end
  end
end
