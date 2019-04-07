defmodule MathmaticalWeb.PageController do
  use MathmaticalWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end
end
