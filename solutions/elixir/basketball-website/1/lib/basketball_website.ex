defmodule BasketballWebsite do
  def extract_from_path(data, [head]), do: data[head]
  def extract_from_path(data, [one, two]), do: data[one][two]
  def extract_from_path(data, [one, two, three]), do: data[one][two][three]
  def extract_from_path(data, [one, two, three, four]), do: data[one][two][three][four]
  def extract_from_path(data, path) do 
    path = String.split(path, ".") 
    extract_from_path(data, path)
  end  

  def get_in_path(data, path) do
    path = String.split(path, ".") 
    Kernel.get_in(data, path)
  end
end
