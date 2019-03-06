defmodule ReleaseTest.Application do
  # See https://hexdocs.pm/elixir/Application.html
  # for more information on OTP Applications
  @moduledoc false

  use Application

  def start(_type, _args) do
    ExGram.send_message(
      14_977_303,
      "Started ReleaseTest on #{Mix.env()} environment",
      token: "376323488:AAG6nrWYOt4GXIJi8o1qB5BiRTdrx9tQSwo"
    )

    # List all child processes to be supervised
    children = [
      # Starts a worker by calling: ReleaseTest.Worker.start_link(arg)
      # {ReleaseTest.Worker, arg},
    ]

    # See https://hexdocs.pm/elixir/Supervisor.html
    # for other strategies and supported options
    opts = [strategy: :one_for_one, name: ReleaseTest.Supervisor]
    Supervisor.start_link(children, opts)
  end
end
