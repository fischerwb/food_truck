import Config

# We don't run a server during test. If one is required,
# you can enable the server option below.
config :food_truck, FoodTruckWeb.Endpoint,
  http: [ip: {127, 0, 0, 1}, port: 4002],
  secret_key_base: "j2Vfq1AYz1AA2qZMfOGkhlnaUgdt7aqMsNF8VnYihioyx8tFpnw9IYFZFFPGoUnY",
  server: false

# Print only warnings and errors during test
config :logger, level: :warning

# Initialize plugs at runtime for faster test compilation
config :phoenix, :plug_init_mode, :runtime
