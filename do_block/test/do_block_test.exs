defmodule DoBlockTest do
  use ExUnit.Case
  doctest DoBlock

  test "greets the world" do
    assert DoBlock.hello() == :world
  end
end
