defmodule Mathmatical.Repo do
  use Ecto.Repo,
    otp_app: :mathmatical,
    adapter: Ecto.Adapters.Postgres
end
