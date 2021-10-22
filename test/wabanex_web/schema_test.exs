defmodule WabanexWeb.SchemaTest do
  use WabanexWeb.ConnCase, async: true

  alias Wabanex.User
  alias Wabanex.Users.Create, as: CreateUser

  describe "user query" do
    test "when a valid id is given, returns the user", %{conn: conn} do
      params = %{name: "John Doe", email: "johndoe@example.com", password: "123456"}

      {:ok, %User{id: user_id}} = CreateUser.call(params)

      query = """
        {
          getUser(id: "#{user_id}") {
            id
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: query})
        |> json_response(200)

      expected_response = %{
        "data" => %{
          "getUser" => %{
            "email" => "johndoe@example.com",
            "id" => user_id,
            "name" => "John Doe"
          }
        }
      }

      assert response == expected_response
    end
  end

  describe "user mutation" do
    test "when all params are valid, creates the user", %{conn: conn} do
      mutation = """
        mutation {
          createUser(input: {
            name: "John Doe",
            email: "johndoe@example.com",
            password: "123456"
          }) {
            name
            email
          }
        }
      """

      response =
        conn
        |> post("/api/graphql", %{query: mutation})
        |> json_response(200)

      expected_response = %{
        "data" => %{
          "createUser" => %{
            "email" => "johndoe@example.com",
            "name" => "John Doe"
          }
        }
      }

      assert response == expected_response
    end
  end
end
