defmodule WabanexWeb.IMCControllerTest do
  use WabanexWeb.ConnCase, async: true

  describe "index/2" do
    test "when all params are valid, returns the imc info", %{conn: conn} do

      params = %{"filename" => "students.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:ok)
        expected_response = %{"result" => %{"Deborah" => 19.531249999999996, "Lorenzo" => 23.04002019946976, "Rafael" => 24.897060231734173}}
      assert expected_response == response
    end

    test "when there are invalid, returns an error", %{conn: conn} do

      params = %{"filename" => "banana.csv"}

      response =
        conn
        |> get(Routes.imc_path(conn, :index, params))
        |> json_response(:bad_request)

        expected_response = %{"result" => "Error while opening the file"}

      assert expected_response == response
    end
  end

end
