# Use the Plot struct as it is provided
defmodule Plot do
  @enforce_keys [:plot_id, :registered_to]
  defstruct [:plot_id, :registered_to]
end

defmodule CommunityGarden do
  def start(opts \\ []) do
    initial_state = %{plots: [], id_counter: 0}
    Agent.start(fn -> initial_state end, opts)
  end

  def list_registrations(pid) do
    Agent.get(pid, fn state -> state.plots end)
  end

  def register(pid, name) do
    Agent.get_and_update(pid, fn %{plots: plots, id_counter: id} = state ->
      new_id = id + 1
      new_plot = %Plot{plot_id: new_id, registered_to: name}
      
      {new_plot, %{state | plots: [new_plot | plots], id_counter: new_id}}
    end)
  end

  def release(pid, plot_id) do
    Agent.get_and_update(pid, fn %{plots: plots, id_counter: id} = state ->
      plots = Enum.reject(plots, fn plot -> plot.plot_id == plot_id end)
      
      {:ok, %{state | plots: plots, id_counter: id}}
    end)
  end

  def get_registration(pid, plot_id) do
    Agent.get_and_update(pid, fn %{plots: plots, id_counter: id} = state ->
      plot = Enum.find(plots, fn plot -> plot.plot_id == plot_id end)

      if not is_nil(plot) do 
        {plot, state} 
      else
        {{:not_found, "plot is unregistered"}, state}
      end
    end)
  end
end
