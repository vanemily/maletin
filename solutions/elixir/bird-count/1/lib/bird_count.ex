defmodule BirdCount do 
  def today(list) do
    if length(list) > 0 do
      [head | _tail] = list
      head
    else
      nil
    end
  end

  def increment_day_count(list) do
    if length(list) > 0 do
      [head | tail] = list
      [ head + 1 | tail ] 
    else
      [1]
    end
  end

  def has_day_without_birds?([]), do: false

  def has_day_without_birds?([head | _tail]) when head == 0, do: true

  def has_day_without_birds?([head | tail]), do: has_day_without_birds?(tail)

  def total([]), do: 0

  def total([head | tail]), do: head + total(tail)

  def busy_days([]), do: 0

  def busy_days([head | tail]) when head >= 5, do: 1 + busy_days(tail)

  def busy_days([head | tail]) when head < 5, do: busy_days(tail)

end
