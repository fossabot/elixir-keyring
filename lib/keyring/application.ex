defmodule Keyring.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application
  import Supervisor.Spec

  def start(_type, _args) do
    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: Keyring.Worker.start_link(arg)
      # {Keyring.Worker, arg},
      supervisor(Registry, [:unique, :keyring_registry], id: :keyring_registry),
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: Keyring.Supervisor]
    Supervisor.start_link(children, opts)
  end


end