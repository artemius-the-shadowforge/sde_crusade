defmodule Spiral do
  @doc """
  Given the dimension, return a square matrix of numbers in clockwise spiral order.
  """
  @spec matrix(dimension :: integer) :: list(list(integer))
  def matrix(dimension) do
    # 1..dimenstion
    # r,c = 0,0
    # left to right
    # {r, 0}, {r,1}, {r,2} c =2
    # right to bottom
    # {0, c}, {1, c}, {2, c} r = 2
    # right to left
    # {2, 2 - 1}, {2, 0} c  = 0
    # bottom to top
    # {2 - 1, 0}

    matrix = prepare_matrix(dimension)
    do_spiral(0,dimension-1, dimension - 1, 0, {[], 0})
    # left to right
    # fill_row()
    # |> fill_column()
    # |> fill_row()
    # |> fill_column()
  end

  # defp do_spiral(left, bottom, right, top, acc) when top > bottom or left > right,
  #  do: acc

  defp do_spiral(left, right, bottom, top, {matrix, n}) do
    # left to right
    {top_row, n} =
      top..right
      |> Enum.reduce({[], n}, fn _x, {acc, n} -> {[n + 1 | acc], n + 1} end)

    # right to bottom
    {right_col, n} =
      (top + 1)..bottom
      |> Enum.reduce({[], n}, fn _x, {acc, n} -> {[n + 1 | acc], n + 1} end)

    IO.inspect({Enum.reverse(top_row), Enum.reverse(right_col)})
  end

  # defp fill_row(matrix, r, c) do
  #  Enum.
  # end

  defp prepare_matrix(number) do
    [
      [0, 0, 0],
      [0, 0, 0],
      [0, 0, 0]
    ]
  end

  # 1 2 3
  # 6 9 8
  # 7 4 5

  # defp prepare_matrix(number) do
  #   for x <- 1..number, reduce: []
  #     do: for _ <- 1..number, do:
  #   reduce: x + 1
  # end
end

Spiral.matrix(3) |> IO.inspect()