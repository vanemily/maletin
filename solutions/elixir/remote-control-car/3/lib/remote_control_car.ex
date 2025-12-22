defmodule RemoteControlCar do
  @enforce_keys [:nickname]

  defstruct [
    :nickname,
    battery_percentage: 100, 
    distance_driven_in_meters: 0
  ]

  def new(nickname \\ "none"), do: %__MODULE__{nickname: nickname}

  def display_distance(%__MODULE__{distance_driven_in_meters: distance}), do: "#{distance} meters"

  def display_battery(%__MODULE__{battery_percentage: 0}), do: "Battery empty"
  def display_battery(%__MODULE__{battery_percentage: level}), do: "Battery at #{level}%"

  def drive(%__MODULE__{} = remote_car) do
    drained_battery = remote_car.battery_percentage - 1

    if drained_battery > 0 do 
      %{remote_car | battery_percentage: drained_battery, distance_driven_in_meters: 20}
    else
      remote_car
    end
  end
end
