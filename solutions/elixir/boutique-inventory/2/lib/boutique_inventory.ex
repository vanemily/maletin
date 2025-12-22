defmodule BoutiqueInventory do
  def sort_by_price(inventory), do: Enum.sort_by(inventory, &(&1.price))

  def with_missing_price(inventory), do: Enum.filter(inventory,  &(&1.price == nil))

  def update_names(inventory, old_word, new_word) do
    Enum.map(inventory, fn item ->
      Map.update!(item, :name, fn element -> String.replace(element, old_word, new_word) end)
    end)
  end

  def increase_quantity(item, count) do
    Map.update!(item, :quantity_by_size, fn quantity -> 
      Map.new(quantity, fn {key, value} -> {key, value + count} end)
    end)
  end

  def total_quantity(item) do
    Enum.reduce(item.quantity_by_size, 0, fn {_key, value}, acc -> value + acc end)
  end
end
