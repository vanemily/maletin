defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, &(&1.price))

  def with_missing_price(inventory), do: Enum.filter(inventory,  &(&1.price == nil))

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn element ->
      new_name = String.replace(element.name, old_word, new_word)
      Map.replace(element, :name, new_name)  
    end)
  end

  def increase_quantity(item, count) do
    new_quantities = 
    item
    |> Map.get(:quantity_by_size)
    |> Enum.to_list()
    |> Enum.map(fn {key, value} -> {key, value + count} end)
    |> Map.new()
    
    Map.replace(item, :quantity_by_size, new_quantities)
  end

  def total_quantity(item) do
    item
    |> Map.get(:quantity_by_size)
    |> Enum.to_list()
    |> Enum.reduce(0, fn {key, value}, acc -> value + acc end)
  end
end
