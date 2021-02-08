defmodule ExCasparTest do
  use ExUnit.Case
  doctest ExCaspar

  test "greets the world" do
    assert ExCaspar.hello() == :world
  end
end
