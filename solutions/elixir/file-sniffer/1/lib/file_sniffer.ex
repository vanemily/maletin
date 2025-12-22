defmodule FileSniffer do
  def type_from_extension("exe"), do: "application/octet-stream"
  def type_from_extension("bmp"), do: "image/bmp"
  def type_from_extension("png"), do: "image/png"
  def type_from_extension("jpg"), do: "image/jpg"
  def type_from_extension("gif"), do: "image/gif"
  def type_from_extension(_extension), do: nil

  def type_from_binary(<<127, 69, 76, 70, rest::binary>>), do: "application/octet-stream"
  def type_from_binary(<<66, 77, rest::binary>>), do: "image/bmp"
  def type_from_binary(<<137, 80, 78, 71, 13, 10, 26, 10, rest::binary>>), do: "image/png"
  def type_from_binary(<<255, 216, 255, rest::binary>>), do: "image/jpg"
  def type_from_binary(<<71, 73, 70, rest::binary>>), do: "image/gif"
  def type_from_binary(_), do: nil
  
  def verify(file_binary, extension) do
    type_from_extension = type_from_extension(extension)
    type_from_binary = type_from_binary(file_binary)

    if type_from_extension == type_from_binary do 
        {:ok, type_from_extension}
      else
        {:error, "Warning, file format and file extension do not match."}
    end
  end
end
