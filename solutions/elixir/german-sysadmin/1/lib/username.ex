defmodule Username do
  def sanitize([head | tail] = username) when head >= 97 and head <= 122 or head in [95, 228, 246, 252, 223] do
    IO.puts(head)
    case head do 
     head when head == ?ä -> [97, 101] ++ sanitize(tail) 
     head when head == ?ö -> [111, 101] ++ sanitize(tail)
     head when head == ?ü -> [117, 101] ++ sanitize(tail)
     head when head == ?ß -> [115, 115] ++ sanitize(tail)
     _ -> [head] ++ sanitize(tail)
    end
  end

  def sanitize([_head | tail]) do 
    sanitize(tail)
  end 

  def sanitize([]), do: []
end
