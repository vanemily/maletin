defmodule BasketballWebsite do
  def extract_from_path(nil, _path), do: nil
  def extract_from_path(data, []), do: data
  def extract_from_path(data, [key | keys]),
    do: extract_from_path(data[key], keys)

  def extract_from_path(data, path) when is_binary(path),
    do: extract_from_path(data, keys_from_path(path))
  
  @spec get_in_path(map(), String.t()) :: String.t()
  def get_in_path(data, path) do
    get_in(data, keys_from_path(path))
  end

  @spec keys_from_path(String.t()) :: list()
  defp keys_from_path(path), do: String.split(path, ".") 
end
