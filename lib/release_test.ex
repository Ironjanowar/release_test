defmodule ReleaseTest do
  use GenServer

  def child_spec() do
    %{
      id: ReleaseTest,
      start: {ReleaseTest, :start_link, []}
    }
  end

  # Client API
  def start_link(default) do
    GenServer.start_link(__MODULE__, default)
  end

  # Server callbacks
  def init(state) do
    ExGram.send_message(
      14_977_303,
      "Started ReleaseTest on #{Mix.env()} environment",
      token: "376323488:AAG6nrWYOt4GXIJi8o1qB5BiRTdrx9tQSwo"
    )

    {:ok, state}
  end
end
