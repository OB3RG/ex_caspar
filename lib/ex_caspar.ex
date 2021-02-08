defmodule ExCaspar do
  use Application

  def start(_type, _args) do
    IO.puts("hello")
    ExCaspar.Supervisor.start_link([])
  end
end
