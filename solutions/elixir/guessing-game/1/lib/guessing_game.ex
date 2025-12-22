defmodule GuessingGame do
  def compare(secret_number, guess \\ :no_guess)
  def compare(secret_number, guess) when is_integer(guess) and (secret_number == guess), do: "Correct"
  def compare(secret_number, guess) when is_integer(guess) and (secret_number - guess == 1 or guess - secret_number == 1), do: "So close"
  def compare(secret_number, guess) when is_integer(guess) and (guess > secret_number), do: "Too high"
  def compare(secret_number, guess) when is_integer(guess) and (guess < secret_number), do: "Too low"
  def compare(secret_number, unknown), do: "Make a guess"
end
