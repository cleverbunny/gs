defmodule GsTest do
  use ExUnit.Case
  doctest Gs

  test "the truth" do
    spreadsheet_id = "1Fl6DYfLWVu2P4vQha-ejV4tXWENSbGFNSeopqCajKoo"
    range = "Sheet1!A1:E1"
    body = %{body: %{
              range: range,
              majorDimension: "ROWS",
              values: [
                  ["Door", "$15", "2", "3/15/2016"],
                  ["Engine", "$100", "1", "3/20/2016"],
                ],
             }
    }

    assert Gs.post(spreadsheet_id, range, body) == :ok
  end
end
