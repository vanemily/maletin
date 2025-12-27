defmodule CaptainsLog do
  @planetary_classes ["D", "H", "J", "K", "L", "M", "N", "R", "T", "Y"]

  def random_planet_class() do
    Enum.random(@planetary_classes)
  end

  def random_ship_registry_number() do
    random_number = Enum.random(1_000..9_999)
    
    "NCC-#{random_number}"
  end

  def random_stardate() do
    41_000.0 + :rand.uniform() * 1_000.0
  end

  def format_stardate(stardate) do
    char_stardate = :io_lib.format("~.1f", [stardate])
    to_string(char_stardate)
  end
end
