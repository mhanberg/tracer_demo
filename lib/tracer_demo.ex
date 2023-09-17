defmodule TracerDemo do
  defmacrop some_macro(list) do
    quote do
      Enum.map(unquote(list), fn str -> String.upcase(str) end)
    end
  end

  def hello(arg) do
    "hello #{arg}!"
    some_macro(["hello", arg, "!"])
  end
end
