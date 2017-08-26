defmodule Gs do
  @moduledoc """
  Documentation for Gs.
  """

  def post(spreadsheet_id, range, body) do
    body = %{body: body}

    url = "https://sheets.googleapis.com/v4/spreadsheets/#{spreadsheet_id}/values/#{range}:append?valueInputOption=USER_ENTERED"

    options = [{"Content-Type", "application/json"}]

    json_encoded_body = Poison.encode!(body)
    HTTPoison.post(url, json_encoded_body, options)
  end
end
