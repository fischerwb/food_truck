defmodule FoodTruckWeb.ApiControllerTest do
  use FoodTruckWeb.ConnCase

  @moduletag :capture_log

  test "get all", %{conn: conn} do
    conn = get(conn, "/api/all")
    assert response_content_type(conn, :json)
    data = response(conn, 200)
           |> Jason.decode!(keys: :atoms!)

    refute Enum.empty?(data)
    assert Enum.count(data) == 152
  end

  describe "most_choices" do
    test "block", %{conn: conn} do
      conn = get(conn, "/api/blocks")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 109

      [most | _] = data
      assert most.id == "0260"
      assert Enum.count(most.locations) == 6
    end

    test "fire_district", %{conn: conn} do
      conn = get(conn, "/api/fire_districts")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 16

      [most | _] = data
      assert most.id == "10"
      assert Enum.count(most.locations) == 29
    end

    test "police_district", %{conn: conn} do
      conn = get(conn, "/api/police_districts")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 11

      [most | _] = data
      assert most.id == "3"
      assert Enum.count(most.locations) == 43
    end

    test "sup_district", %{conn: conn} do
      conn = get(conn, "/api/sup_districts")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 11

      [most | _] = data
      assert most.id == "10"
      assert Enum.count(most.locations) == 42
    end
  end

  describe "by_block" do
    test "success", %{conn: conn} do
      conn = get(conn, "/api/block/0140")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 5
    end

    test "bad block", %{conn: conn} do
      conn = get(conn, "/api/block/1234")
      assert response(conn, 404)
    end
  end

  describe "by_fire_district" do
    test "success", %{conn: conn} do
      conn = get(conn, "/api/fire_district/1")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 4
    end

    test "bad district", %{conn: conn} do
      conn = get(conn, "/api/fire_district/20")
      assert response(conn, 404)
    end
  end

  describe "by_police_district" do
    test "success", %{conn: conn} do
      conn = get(conn, "/api/police_district/1")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 34
    end

    test "bad district", %{conn: conn} do
      conn = get(conn, "/api/police_district/20")
      assert response(conn, 404)
    end
  end

  describe "by_sup_district" do
    test "success", %{conn: conn} do
      conn = get(conn, "/api/sup_district/1")
      assert response_content_type(conn, :json)
      data = response(conn, 200)
             |> Jason.decode!(keys: :atoms!)

      refute Enum.empty?(data)
      assert Enum.count(data) == 3
    end

    test "bad district", %{conn: conn} do
      conn = get(conn, "/api/sup_district/20")
      assert response(conn, 404)
    end
  end
end
