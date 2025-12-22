defmodule BasketballWebsite do
  def extract_from_path(nil, path), do: nil
  def extract_from_path(data, path) when is_binary(path) do 
    Enum.reduce(keys_from_path(path), data, fn p, acc -> acc[p] end)  
  end  

  @spec get_in_path(map(), String.t()) :: String.t()
  def get_in_path(data, path) do
    get_in(data, keys_from_path(path))
  end

  @spec keys_from_path(String.t()) :: list()
  defp keys_from_path(path), do: String.split(path, ".") 
end
