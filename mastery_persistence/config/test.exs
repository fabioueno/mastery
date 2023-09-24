import Config

config :mastery_persistence, MasteryPersistence.Repo,
  database: "mastery_test",
  hostname: "localhost",
  password: "postgres",
  username: "postgres",
  pool: Ecto.Adapters.SQL.Sandbox
