defmodule Calc do
  def gen(times), do: for(i <- 1..times, do: i)

  def split(enumerable) do
    enumerable
    |> Enum.split(enumerable |> length() |> div(2))
  end

  def sum(enumerable, pid) do
    spawn(fn -> send(pid, {:value, Enum.sum(enumerable)}) end)
  end

  def receiver() do
    receive do
      {:value, value} ->
        IO.inspect(value)
    after
      1_000 ->
        IO.puts("nothing after 1s")
        Process.exit(self(), :normal)
    end

    receiver()
  end
end

{x, y} = Calc.gen(10000) |> Calc.split()

Calc.sum(x, self())
Calc.sum(y, self())

Calc.receiver()
