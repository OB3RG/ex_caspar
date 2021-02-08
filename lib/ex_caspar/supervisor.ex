defmodule ExCaspar.Supervisor do
  use Supervisor

  # Client
  def start_link(opts \\ []) do
    Supervisor.start_link(__MODULE__, :ok, opts)
  end

  # Server
  def init(_args) do
    children = [
      {ExCaspar.StateListener, [name: StateListener]}
    ]

    Supervisor.init(children, strategy: :one_for_one)
  end
end
