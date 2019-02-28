defmodule Calc do
  def gen(times), do: for(i <- 1..times, do: i)

  def split(enumerable) do
    enumerable
    |> Enum.split(enumerable |> length() |> div(2))
  end
end

{x, y} = Calc.gen(10000) |> Calc.split()

Calc.run({x, y})

IO.inspect(x)
