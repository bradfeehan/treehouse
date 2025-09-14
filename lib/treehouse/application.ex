defmodule Treehouse.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  @impl true
  def start(_type, _args) do
    children = [
      TreehouseWeb.Telemetry,
      Treehouse.Repo,
      {DNSCluster, query: Application.get_env(:treehouse, :dns_cluster_query) || :ignore},
      {Phoenix.PubSub, name: Treehouse.PubSub},
      # Start a worker by calling: Treehouse.Worker.start_link(arg)
      # {Treehouse.Worker, arg},
      # Start to serve requests, typically the last entry
      TreehouseWeb.Endpoint
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Treehouse.Supervisor]
    Supervisor.start_link(children, opts)
  end

  # Tell Phoenix to update the endpoint configuration
  # whenever the application is updated.
  @impl true
  def config_change(changed, _new, removed) do
    TreehouseWeb.Endpoint.config_change(changed, removed)
    :ok
  end
end
