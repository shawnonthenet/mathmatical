defmodule MathmaticalWeb.QuestionController do
  use MathmaticalWeb, :controller

  def index(conn, _params) do
    render conn, "index.html", questions: Mathmatical.Questions.list_questions()
  end

  def new(conn, _params) do
    render conn, "new.html", changeset: Mathmatical.Questions.change_question(%Mathmatical.Questions.Question{})
  end

  def create(conn, %{"question" => question_attrs}) do
    case Mathmatical.Questions.create_question(question_attrs) do
      {:ok, _question} ->
        conn
        |> put_flash(:info, "Question Added")
        |> render("new.html", changeset: Mathmatical.Questions.change_question(%Mathmatical.Questions.Question{}))
      {:error, changeset} ->
        conn
        |> put_flash(:error, "Unable to save")
        |> render("new.html", changeset: changeset)
    end
  end
end
