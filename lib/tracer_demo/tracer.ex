defmodule TracerDemo.Tracer do
  def trace(it, _env) do
    dbg(it)
    :ok
  end
end
