defmodule Lists.Tax do
  @moduledoc """
  Taxes to orders.
  """

  @doc """
  Apply function.

  ## Example
      iex> tax_rates = [ NC: 0.075, TX: 0.08 ]
      iex> orders = [
      iex>   [ id: 123, ship_to: :NC, net_amount: 100.00 ],
      iex>   [ id: 124, ship_to: :OK, net_amount:  35.50 ],
      iex>   [ id: 125, ship_to: :TX, net_amount:  24.00 ],
      iex>   [ id: 126, ship_to: :TX, net_amount:  44.80 ],
      iex>   [ id: 127, ship_to: :NC, net_amount:  25.00 ],
      iex>   [ id: 128, ship_to: :MA, net_amount:  10.00 ],
      iex>   [ id: 129, ship_to: :CA, net_amount: 102.00 ],
      iex>   [ id: 120, ship_to: :NC, net_amount:  50.00 ]
      iex> ]
      iex> Lists.Tax.apply(orders, tax_rates)
      [
        [ id: 123, ship_to: :NC, net_amount: 100.00, total_amount: 107.5 ],
        [ id: 124, ship_to: :OK, net_amount:  35.50, total_amount: 35.5 ],
        [ id: 125, ship_to: :TX, net_amount:  24.00, total_amount: 25.92 ],
        [ id: 126, ship_to: :TX, net_amount:  44.80, total_amount: 48.38 ],
        [ id: 127, ship_to: :NC, net_amount:  25.00, total_amount: 26.88 ],
        [ id: 128, ship_to: :MA, net_amount:  10.00, total_amount: 10.0 ],
        [ id: 129, ship_to: :CA, net_amount: 102.00, total_amount: 102.0 ],
        [ id: 120, ship_to: :NC, net_amount:  50.00, total_amount: 53.75 ]
      ]
  """
  def apply(orders, tax_rates) do
    for order <- orders, do: order ++ [total_amount: _total_amount(order[:net_amount], tax_rates[order[:ship_to]])]
  end
  defp _total_amount(net_amount, nil), do: net_amount
  defp _total_amount(net_amount, tax_rate), do: Float.round(net_amount * (tax_rate + 1), 2)
end
