defmodule HighScore do

  @default_score 0

  def new(), do: %{}

  def add_player(scores, name, score \\ 0) do
    Map.put(scores, name, score)
  end

  def remove_player(scores, name) do
    Map.delete(scores, name)
  end

  def reset_score(scores, name) do
    if Map.has_key?(scores, name) do
      Map.replace(scores, name, @default_score)
    else
      Map.put_new(scores, name, @default_score)
    end
  end

  def update_score(scores, name, score) do
    if Map.has_key?(scores, name) do
      Map.update(scores, name, @default_score, fn existing_value -> existing_value + score end)
    else
      Map.put_new(scores, name, score)
    end
  end

  def get_players(scores), do: Map.keys(scores)
end
