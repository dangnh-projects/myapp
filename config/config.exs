# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
use Mix.Config

config :myapp,
  ecto_repos: [Myapp.Repo]

# Configures the endpoint
config :myapp, MyappWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "FxtMD8BZjci1uOPnaQU6owmIBlQfKKz29eJS3j6ZX+GcmPl5yJAQPkl+XzhRN9AX",
  render_errors: [view: MyappWeb.ErrorView, accepts: ~w(html json), layout: false],
  pubsub_server: Myapp.PubSub,
  live_view: [signing_salt: "91dehZnT"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env()}.exs"

# Myapp.Email.welcome_email() |> Myapp.Mailer.deliver_now
config :myapp, Myapp.Mailer,
  adapter: Bamboo.SMTPAdapter,
  server: "smtp.office365.com",
  #hostname: "www.mydomain.com",
  port: 587,
  username: "dangnh@nhg.vn", # or {:system, "SMTP_USERNAME"}
  password: "Santazero1", # or {:system, "SMTP_PASSWORD"}
  tls: :if_available, # can be `:always` or `:never`
  allowed_tls_versions: [:"tlsv1", :"tlsv1.1", :"tlsv1.2"],
  # or {":system", ALLOWED_TLS_VERSIONS"} w/ comma seprated values (e.g. "tlsv1.1,tlsv1.2")
  ssl: false, # can be `true`,
  retries: 1,
  no_mx_lookups: false, # can be `true`
  auth: :if_available # can be `always`.
