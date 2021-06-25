defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create

  describe "users query" do
    test "when an invalid id is given, returns error", %{conn: conn} do
      params =  %{"Deborah" => 19.531249999999996, "Lorenzo" => 23.04002019946976, "Rafael" => 24.897060231734173}

      {:ok, %User{id: user_id}} = Create.call(params)

      query = """
      {
        getUser(id: "#{user_id}"){
          name
          email
        }
      }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(:error)


        expected_response = %{
          "data" => %{
            "getUser" => %{
              "email" => "lorenzo@lorenzo.com",
              "name" => "Lorenzo"
            }
          }
        }

        assert expected_response == response
      end
    end

end
