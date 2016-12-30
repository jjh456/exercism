defmodule SpaceAge do
  @type planet :: :mercury | :venus | :earth | :mars | :jupiter
                | :saturn | :uranus | :neptune
  @one_earthyear_seconds 31557600
  @planet_earthyear_periods [
    earth: 1,
    mercury: 0.2408467,
    venus: 0.61519726,
    mars: 1.8808158,
    jupiter: 11.862615,
    saturn: 29.447498,
    uranus: 84.016846,
    neptune: 164.79132
  ]

  @doc """
  Return the number of years a person that has lived for 'seconds' seconds is
  aged on 'planet'.
  """
  @spec age_on(planet, pos_integer) :: float
  def age_on(planet, seconds) do
    seconds / (@one_earthyear_seconds * @planet_earthyear_periods[planet])
  end

  @spec get_earthyear_period(planet) :: float
  def get_earthyear_period(planet), do: @planet_earthyear_periods[planet]
end
