defmodule RemoteControlCar do
  @enforce_keys [:nickname]
  defstruct [
    :nickname,
    battery_percentage: 100, 
    distance_driven_in_meters: 0
  ]

  def new(), do: %RemoteControlCar{nickname: "none"}
  def new(nickname), do: %RemoteControlCar{nickname: nickname}

  def display_distance(%RemoteControlCar{} = remote_car) do
    num_meters = remote_car.distance_driven_in_meters
    "#{num_meters} meters"
  end

  def display_battery(%RemoteControlCar{} = remote_car) do
    case remote_car.battery_percentage do 
      0 -> "Battery empty"
      percentage -> "Battery at #{percentage}%"
    end
  end

  def drive(%RemoteControlCar{} = remote_car) do
    drained_battery = remote_car.battery_percentage - 1

    if drained_battery > 0 do 
      %{remote_car | battery_percentage: drained_battery, distance_driven_in_meters: 20}
    else
      remote_car
    end
  end
end
