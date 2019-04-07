defmodule MathmaticalWeb.QuestionsChannel do
  use MathmaticalWeb, :channel

  def join("questions", _payload, socket) do
    {:ok, socket}
  end

  # Channels can be used in a request/response fashion
  # by sending replies to requests from the client
  def handle_in("get_next_question", %{"id" => id}, socket) when is_bitstring(id), do: handle_in("get_next_question", %{"id" => String.to_integer(id)}, socket)
  def handle_in("get_next_question", %{"id" => id}, socket) when is_integer(id) do
    next_question = Mathmatical.Questions.get_next_question(id)
    if next_question do
      push(socket, "new_question", format_question(next_question))
    else
      push(socket, "finished", %{})
    end
    {:noreply, socket}
  end

  def handle_in("submit_answer", %{"id" => id, "answer" => answer}, socket) do
    q = Mathmatical.Questions.get_question!(id)
    push(socket, "answer_result", %{question: format_question(q), answer: answer, result: q.answer == answer})
    {:noreply, socket}
  end

  defp format_question(q), do: %{id: q.id, question: q.question, answer: q.answer}
end
