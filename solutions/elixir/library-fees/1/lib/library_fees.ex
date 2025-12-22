defmodule LibraryFees do
  @noon ~T[12:00:00]
  @days_before_noon 28
  @days_after_noon 29

  def datetime_from_string(string) do
    case NaiveDateTime.from_iso8601(string) do
      {:ok, datetime} -> datetime
      {:error, :invalid_format} = error -> error
    end
  end

  def before_noon?(datetime) do
    datetime
    |> NaiveDateTime.to_time()
    |> Time.compare(@noon)
    |> case do 
        :lt -> true
        _ -> false
      end
  
  end

  def return_date(checkout_datetime) do
    checkout_date = NaiveDateTime.to_date(checkout_datetime)
    
    if before_noon?(checkout_datetime) do 
      Date.add(checkout_date, @days_before_noon)
    else
      Date.add(checkout_date, @days_after_noon)
    end
  end

  def days_late(planned_return_date, actual_return_datetime) do
    case Date.compare(actual_return_datetime, planned_return_date) do 
      :gt -> Date.diff(actual_return_datetime, planned_return_date) 
      _ -> 0
    end
  end

  def monday?(datetime) do
    datetime
    |> Date.day_of_week()
    |> case do 
        1 -> true
        _ -> false
      end
  end

  def calculate_late_fee(checkout, return, rate) do
    return_planning_date = checkout
    |> datetime_from_string()
    |> return_date()
    
    return_datetime = datetime_from_string(return)
    
    case days_late(return_planning_date, return_datetime) do 
      0 -> 0
      day -> 
        if monday?(return_datetime) do 
          trunc((day * rate) * 0.5)
        else
            day * rate
        end
    end
  end
end
