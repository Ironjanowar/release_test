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
    GenServer.start_link(__MODULE__, default, name: ReleaseTest)
  end

  def send_message() do
    GenServer.cast(ReleaseTest, {:send, "Hello there"})
  end

  # Server callbacks
  def init(state) do
    ExGram.send_message(
      14_977_303,
      "Started ReleaseTest on #{inspect(state)} environment",
      token: "376323488:AAG6nrWYOt4GXIJi8o1qB5BiRTdrx9tQSwo"
    )

    {:ok, state}
  end

  def handle_cast({:send, message}, state) do
    ExGram.send_message(
      14_977_303,
      message,
      token: "376323488:AAG6nrWYOt4GXIJi8o1qB5BiRTdrx9tQSwo"
    )

    {:noreply, state}
  end
end
