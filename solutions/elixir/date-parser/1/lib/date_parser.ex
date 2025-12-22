defmodule DateParser do
  def day(), do: ~s/[0-9]/

  def month(), do: ~s/[0-9]/

  def year(), do: ~s/[0-9]{4}/

  def day_names(), do: ~s/(Monday|Tuesday|Wednesday|Thursday|Friday|Saturday|Sunday)/

  def month_names() do
    ~s/(January|February|March|April|May|June|July|August|September|October|November|December)/
  end

  def capture_day(), do: ~s/(?<day>#{day()}{1,2})/

  def capture_month(), do: ~s/(?<month>#{month()}{1,2})/

  def capture_year(), do: ~s/(?<year>#{year()})/

  def capture_day_name(), do: ~s/(?<day_name>#{day_names()})/

  def capture_month_name(), do: ~s/(?<month_name>#{month_names()})/

  def capture_numeric_date() do
    ~s"#{capture_day()}/#{capture_month()}/#{capture_year()}" 
  end

  def capture_month_name_date() do
    ~s"#{capture_month_name()}\s#{capture_day()},\s#{capture_year()}"  
  end

  def capture_day_month_name_date() do
    ~s"#{capture_day_name()},\s#{capture_month_name()}\s#{capture_day()},\s#{capture_year()}"
  end

  def match_numeric_date(), do: ~r/^#{capture_numeric_date()}$/

  def match_month_name_date(), do: ~r/^#{capture_month_name_date()}$/

  def match_day_month_name_date(), do: ~r/^#{capture_day_month_name_date()}$/
end
