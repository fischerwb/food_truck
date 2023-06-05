# This file is responsible for configuring your application
# and its dependencies with the aid of the Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.

# General application configuration
import Config

config :food_truck,
  ecto_repos: [FoodTruck.Repo]

# Configures the endpoint
config :food_truck, FoodTruckWeb.Endpoint,
  url: [host: "localhost"],
  render_errors: [
    formats: [json: FoodTruckWeb.ErrorJSON],
    layout: false
  ],
  live_view: [signing_salt: "gfbGE+T/"]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:request_id]

# Use Jason for JSON parsing in Phoenix
config :phoenix, :json_library, Jason

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{config_env()}.exs"
