defmodule TakeANumber do
  def start() do
    spawn(fn -> get_message() end)
  end

  defp get_message(state \\ 0) do 
    receive do 
      :stop -> nil
      {:report_state, machine_pid} -> 
          send(machine_pid, state)
          get_message(state)
      {:take_a_number, machine_pid} ->
          state = state + 1
          send(machine_pid, state)
          get_message(state)
      _ -> get_message()
    end
  end
end
