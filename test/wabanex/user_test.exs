defmodule Wabanex.UserTest do
  use Wabanex.DataCase, async: true

  alias Wabanex.User

  describe "changeset/1" do
    test "when all params are valid, returns the valid changeset" do
    params = %{email: "rafael@banana.com", name: "Rafael", password: "123456"}

    response = User.changeset(params)

    assert %Ecto.Changeset{
      valid?: true,
      changes: %{email: "rafael@banana.com", name: "Rafael", password: "123456"},
      errors: []
    } = response
    end

    test "when there are invalid params, returns an invalid changeset" do
      params = %{ name: "Lorenzo", password: "123456"}

      response = User.changeset(params)

      expected_response = %{
        email: ["can't be blank"],


      }
      assert errors_on(response) == expected_response
      end

  end
end
