defmodule TracerDemo.Tracer do
  def trace({:on_module, _bytecode, _}, env) do
    defs = Module.definitions_in(env.module)

    defs =
      for {name, arity} = _def <- defs do
        {name, Module.get_definition(env.module, {name, arity})}
      end

    dbg(defs)

    :ok
  end

  def trace(_it, _env), do: :ok
end
