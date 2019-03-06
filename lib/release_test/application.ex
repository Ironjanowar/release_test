defmodule ReleaseTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    env = Application.get_env(:release_test, :environment)

    # List all child processes to be supervised
    children = [
      {ReleaseTest, env}
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReleaseTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
