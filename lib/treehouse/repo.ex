defmodule Treehouse.Repo do
  use Ecto.Repo,
    otp_app: :treehouse,
    adapter: Ecto.Adapters.Postgres
end
