defmodule Urlboi.Repo do
  use Ecto.Repo,
    otp_app: :urlboi,
    adapter: Ecto.Adapters.Postgres
end
