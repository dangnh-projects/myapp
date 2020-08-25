defmodule Myapp.Repo do
  use Ecto.Repo,
    otp_app: :myapp,
    adapter: Ecto.Adapters.Tds
end

defmodule Myapp.RepoBio do
  use Ecto.Repo,
    otp_app: :myapp,
    adapter: Ecto.Adapters.Tds
end
