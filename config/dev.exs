import Config

config :mastery_persistence, MasteryPersistence.Repo,
  database: "mastery_dev",
  hostname: "localhost",
  password: "postgres",
  username: "postgres"

config :mastery, :persistence_fn, &MasteryPersistence.record_response/2
