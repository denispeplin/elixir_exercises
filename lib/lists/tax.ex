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
      iex> Lists.Tax.apply_rates(orders, tax_rates)
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
  def apply_rates(orders, tax_rates) do
    for order <- orders, do: order ++ [total_amount: _total_amount(order[:net_amount], tax_rates[order[:ship_to]])]
  end
  defp _total_amount(net_amount, nil), do: net_amount
  defp _total_amount(net_amount, tax_rate), do: Float.round(net_amount * (tax_rate + 1), 2)

  @doc """
  Reads data from file and applies taxes.

  ## Example
      iex> tax_rates = [ NC: 0.075, TX: 0.08 ]
      iex> Lists.Tax.from_file("./lib/lists/tax_data.csv", tax_rates)
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
  def from_file(file_name, tax_rates) do
    { :ok, data } = File.read(file_name)
    [header | sales] = data
      |> String.split("\n")
      |> Enum.filter(&String.contains? &1, ",")
      |> Enum.map(&String.split(&1, ","))
    Enum.map(_parse_sales(sales), &List.zip([_parse_header(header), &1]))
      |> apply_rates(tax_rates)
  end
  defp _parse_header(header) do
    Enum.map header, &String.to_atom &1
  end
  defp _parse_sales(sales) do
    Enum.map(sales, &_parse_data(&1))
  end
  defp _parse_data([id, ship_to, total_amount]) do
    [String.to_integer(id), _parse_ship_to(ship_to), String.to_float(total_amount)]
  end
  defp _parse_ship_to(data) do
    [?: | tail ] = String.to_char_list(data)
    List.to_string(tail) |> String.to_atom
  end
end
