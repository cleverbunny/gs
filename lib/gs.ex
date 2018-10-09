defmodule Gs do
  @moduledoc """
  Post data to a Google Spreadsheet

  This module provides a very basic interface to append data to a Google
  Spreadsheet.
  """

  def append(%Gs.Row{range: range, gs_id: gs_id, values: values}) do
    body =
      %{
        range: range,
        majorDimension: "ROWS",
        values: values
      }
      |> Poison.encode!()

    url = url(gs_id, range)

    # Now we can make request:
    Http.post(url, get_token(), body)
  end

  defp url(gs_id, range) do
    sheets_url = Application.get_env(:gs, :sheets_url)

    url_parts = [
      "#{sheets_url}",
      "#{gs_id}",
      "values",
      "#{range}:append?valueInputOption=RAW"
    ]

    Enum.join(url_parts, "/")
  end

  defp get_token do
    scope = Application.get_env(:gs, :scope)

    case Goth.Token.for_scope(scope) do
      {:ok, token} ->
        Map.get(token, :token)

      {:error, error} ->
        raise """
        Error requesting Google token for #{inspect(scope)}!!

        Response: #{inspect(error)}
        """
    end
  end
end
