defmodule NameBadge do
  def print(id, name, department) do

    if id && department do
      "[#{id}] - #{name} - #{String.upcase(department)}"
    else
      cond do 
        id ->  "[#{id}] - #{name} - OWNER"  
        department -> "#{name} - #{String.upcase(department)}"
        true -> "#{name} - OWNER"
      end
    end
  end
end
