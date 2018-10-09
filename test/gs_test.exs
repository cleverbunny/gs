defmodule GsTest do
  use ExUnit.Case
  doctest Gs

  test "Can post to spreadsheet id" do
    row = %Gs.Row{
      range: "Sheet3!A1",
      gs_id: "1Fl6DYfLWVu2P4vQha-ejV4tXWENSbGFNSeopqCajKoo",
      values: [
        ["Keith", "crazy", "2", "3/15/2016", "hello"],
        ["Tanya", "crazy", "1", "3/20/2016"]
      ]
    }

    {:ok, response} = Gs.append(row)
    assert response.status_code == 200
  end
end
