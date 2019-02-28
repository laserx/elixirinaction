defmodule Calc do
  def gen(times), do: for(i <- 1..times, do: i)

  def half(enumerable) do
    enumerable
    |> Enum.split(div(length(enumerable), 2))
  end
end

{x, y} = Calc.gen(10000) |> Calc.half()

IO.inspect(x)
