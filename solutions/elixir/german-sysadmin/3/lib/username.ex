defmodule Username do
  def sanitize([]), do: []

  def sanitize([head | tail]) do
    case head do 
     ?ä -> 'ae' ++ sanitize(tail) 
     ?ö -> 'oe' ++ sanitize(tail)
     ?ü -> 'ue' ++ sanitize(tail)
     ?ß -> 'ss' ++ sanitize(tail)
     ?_ -> '_' ++ sanitize(tail)
     head when head not in ?a..?z -> sanitize(tail)
     tail when tail == [] -> head
     _ -> [head | sanitize(tail)]
    end
  end
end
