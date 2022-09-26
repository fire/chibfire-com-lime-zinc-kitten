defmodule LimeZincKittenTest do
  use ExUnit.Case
  doctest LimeZincKitten

  test "greets the world" do
    assert LimeZincKitten.hello() == :world
  end
end
