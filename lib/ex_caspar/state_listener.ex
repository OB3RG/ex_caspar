defmodule ExCaspar.StateListener do
  @moduledoc """
  GenServer process to listen for osc messages from caspar
  """
  use GenServer

  @default_udp_port 8000

  # Client
  def start_link(options \\ []) do
    port = Keyword.get(options, :port, @default_udp_port)
    GenServer.start_link(__MODULE__, port: port)
  end

  def init(port: port) do
    {:ok, socket} = :gen_udp.open(port, [:binary, {:active, true}])
    {:ok, socket}
  end

  def handle_state(_msg = {:udp, _socket, _send_ip, _send_port, data}, socket) do
    data
    |> OSC.Message.parse()
    |> notify_state_handler

    {:noreply, socket}
  end

  defp notify_state_handler(msg) do
    IO.puts(msg)
  end
end
