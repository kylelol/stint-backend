use Mix.Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :stint, StintWeb.Endpoint,
  http: [port: 4001],
  server: false

# Print only warnings and errors during test
config :logger, level: :warn

# Configure your database
config :stint, Stint.Repo,
  adapter: Ecto.Adapters.Postgres,
  username: "postgres",
  password: "postgres",
  database: "stint_test",
  hostname: "localhost",
  pool: Ecto.Adapters.SQL.Sandbox
