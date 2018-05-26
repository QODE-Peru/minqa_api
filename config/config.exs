# This file is responsible for configuring your application
# and its dependencies with the aid of the Mix.Config module.
#
# This configuration file is loaded before any dependency and
# is restricted to this project.
use Mix.Config

# General application configuration
config :minqa_api,
  ecto_repos: [MinqaApi.Repo]

# Configures the endpoint
config :minqa_api, MinqaApiWeb.Endpoint,
  url: [host: "localhost"],
  secret_key_base: "pKvDGgcCIpvB8PGG5S4ikSaqHUEApRteVe6DYtqjZOpF0hjQbVXvHgVphsfGQ7MQ",
  render_errors: [view: MinqaApiWeb.ErrorView, accepts: ~w(html json)],
  pubsub: [name: MinqaApi.PubSub,
           adapter: Phoenix.PubSub.PG2]

# Configures Elixir's Logger
config :logger, :console,
  format: "$time $metadata[$level] $message\n",
  metadata: [:user_id]

config :minqa_api, MinqaApi.Auth.AccessHtmlPipeline,
  module: MinqaApi.Auth.Guardian,
  error_handler: MinqaApi.Auth.AccessHtmlPipeline.ErrorHandler

config :minqa_api, MinqaApi.Auth.AccessApiPipeline,
  module: MinqaApi.Auth.Guardian,
  error_handler: MinqaApi.Auth.AccessApiPipeline.ErrorHandler

# Import environment specific config. This must remain at the bottom
# of this file so it overrides the configuration defined above.
import_config "#{Mix.env}.exs"
