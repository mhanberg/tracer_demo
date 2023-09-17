defmodule TracerDemoTest do
  use ExUnit.Case
  doctest TracerDemo

  test "greets the world" do
    assert TracerDemo.hello() == :world
  end
end
