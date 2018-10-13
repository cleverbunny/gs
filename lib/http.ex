defmodule Http do
  @moduledoc """
  Handles http communication with Google Spreadsheet

  This module provides a simple wrapper around the httpc erlang library,
  customised for the purpose of communicating with the Google Spreadsheet
  API, so rather than passing the headers which need to be converted to
  a list of tuples containing charlists, you just need to pass the `token`
  and the headers are created for you.

  If the post is successful a `Response` struct is returned, otherwise
  the response from httpc is returned.
  """

  defmodule Response do
    defstruct [:status_code, :status, :headers, :body]
  end

  def post(url, token, body) do
    ensure_all_started()

    request = {String.to_charlist(url), headers(token), 'application/json', body}

    :httpc.request(:post, request, [], [])
    |> format_response()
  end

  defp headers(token) do
    [
      {'Content-Type', 'application/json'},
      {'Authorization', 'Bearer ' ++ String.to_charlist(token)},
      {'Accept', 'Application/json'}
    ]
  end

  defp ensure_all_started() do
    :application.ensure_all_started(:inets)
    :application.ensure_all_started(:ssl)
  end

  defp format_response({:ok, {{'HTTP/1.1', status_code, status}, headers, body}}) do
    {:ok,
     %Response{
       status_code: status_code,
       status: status,
       headers: headers,
       body: body
     }}
  end

  defp format_response(result) do
    result
  end
end
