defmodule BoutiqueSuggestions do
  def get_combinations(tops, bottoms, options \\ []) do
    maximum_price = Keyword.get(options, :maximum_price, 100.00)

    for %{base_color: base_top_color, price: price_top} = top <- tops, 
        %{base_color: base_bottom_color, price: price_bottom}= bottom <- bottoms,
        base_top_color !=  base_bottom_color,
        (price_top + price_bottom) < maximum_price do 
          {top, bottom}  
    end
  end
end
