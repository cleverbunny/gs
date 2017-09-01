defmodule Gs do
  alias Goth.Token

  @moduledoc """
  Documentation for Gs.
  """

  def append(%Gs.Row{range: range, gs_id: gs_id, values: values}) do
    headers =
      get_token()
      |> headers

    body =
      Poison.encode!(%{
        range: range,
        majorDimension: "ROWS",
        values: values,
      })

    url = url(gs_id, range)

    HTTPoison.post(url, body, headers)
  end

  defp url(gs_id, range) do
    sheets_url = Application.get_env(:gs, :sheets_url)
    url_parts =
      [
        "#{sheets_url}",
        "#{gs_id}",
        "values",
        "#{range}:append?valueInputOption=RAW"
      ]
    Enum.join(url_parts, "/")
  end

  defp headers(token) do
    [
      {"Content-Type", "application/json"},
      {"Authorization", "Bearer #{token}"},
      {"Accept", "Application/json"}
    ]
  end

  defp get_token do
    {:ok, token} =
      Application.get_env(:gs, :scope)
      |> Token.for_scope()

    Map.get(token, :token)
  end
end
