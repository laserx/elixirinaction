defmodule Calc do
  def gen(times), do: for(i <- 1..times, do: i)

  def split(enumerable) do
    enumerable
    |> Enum.split(enumerable |> length() |> div(2))
  end
end

{x, y} = Calc.gen(10000) |> Calc.split()

s_1 = spawn(fn x -> Enum.sum(x) end)
s_2 = spawn(fn y -> Enum.sum(y) end)

IO.inspect(s_1)
