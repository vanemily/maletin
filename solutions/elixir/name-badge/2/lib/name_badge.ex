defmodule NameBadge do
  def print(id, name, nil), do: print(id, name, "owner")

  def print(id, name, department) do
    if id do
      "[#{id}] - #{name} - #{String.upcase(department)}"
    else
      "#{name} - #{String.upcase(department)}"
    end
  end
end
