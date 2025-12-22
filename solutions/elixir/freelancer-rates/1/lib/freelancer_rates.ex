defmodule FreelancerRates do

@daily_rate  8.0
@billable_days_per_month 22

  def daily_rate(hourly_rate) do
    # Please implement the daily_rate/1 function
    hourly_rate * @daily_rate
  end

  def apply_discount(before_discount, discount) do
    # Please implement the apply_discount/2 function
    discount_amount = (before_discount * discount) / 100
    before_discount - discount_amount
  end

  def monthly_rate(hourly_rate, discount) do
    # Please implement the monthly_rate/2 function
      monthly_rate = @billable_days_per_month * daily_rate(hourly_rate)
      apply_discount(monthly_rate, discount)      
      |> Float.ceil() 
      |> trunc()
  end

  def days_in_budget(budget, hourly_rate, discount) do
    # Please implement the days_in_budget/3 function
      daily_rate = 
      daily_rate(hourly_rate) 
      |> apply_discount(discount)

      budget / daily_rate |> Float.floor(1)
  end
end
