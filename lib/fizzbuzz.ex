defmodule Fizzbuzz do
  @doc """
  Solution 1:
  """
  @spec solution_1() :: String.t() | integer()
  def solution_1() do
    for num <- 1..100 do
      case {rem(num, 3), rem(num, 5)} do
        {0, 0} -> "FizzBuzz"
        {_rem3, 0} -> "Buzz"
        {0, _rem5} -> "Fizz"
        _ -> num
      end
    end
  end

  @doc """
  Solution 2:
  """
  @spec solution_2() :: String.t() | integer()
  def solution_2() do
    for num <- 1..100 do
      cond do
        rem(num, 15) == 0 -> "FizzBuzz"
        rem(num, 3) == 0 -> "Fizz"
        rem(num, 5) == 0 -> "Buzz"
        true -> num
      end
    end
  end

  @doc """
  Return if the first argument can be divided by the second argument:
  """
  @spec div_by(integer, integer) :: {:ok, boolean()}
  def div_by(num, div) when is_integer(num) and is_integer(div) do
    {:ok, rem(num, div) == 0}
  end
  @spec div_by(any, any) :: {:error, boolean()}
  def div_by(_, _) do
    {:error, "input type error"}
  end

  @doc """
  Solution 3:
  """
  @spec solution_3() :: String.t() | integer()
  def solution_3() do
    for num <- 1..100 do
      with {:ok, by_3} <- div_by(num, 3),
           {:ok, by_5} <- div_by(num, 5),
           true <- by_3 || by_5 do
        a=
          case by_3 do
            true ->
              "Fizz"
            _ ->
              ""
          end
        b=
          case by_5 do
            true ->
              "Buzz"
            _ ->
              ""
          end
        a<>b
      else
        _ ->
          num
      end
    end
  end
end
