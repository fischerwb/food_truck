defmodule FoodTruckWeb.ApiController do
  use FoodTruckWeb, :controller

  def all(conn, _params) do
    data =
      FoodTruckCSV.get_all()
      |> map_and_approved_only()

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(set_status(data), Jason.encode!(data))
  end

  def by_block(conn, %{"id" => block}) do
    data =
      FoodTruckCSV.filter_by_block(block)
      |> map_and_approved_only()

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(set_status(data), Jason.encode!(data))
  end

  def by_fire_district(conn, %{"id" => district}) do
    district = nil_district(district)

    data =
      FoodTruckCSV.filter_by_fire_district(district)
      |> map_and_approved_only()

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(set_status(data), Jason.encode!(data))
  end

  def by_police_district(conn, %{"id" => district}) do
    district = nil_district(district)

    data =
      FoodTruckCSV.filter_by_police_district(district)
      |> map_and_approved_only()

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(set_status(data), Jason.encode!(data))
  end

  def by_sup_district(conn, %{"id" => district}) do
    district = nil_district(district)

    data =
      FoodTruckCSV.filter_by_sup_district(district)
      |> map_and_approved_only()

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(set_status(data), Jason.encode!(data))
  end

  def blocks(conn, _params) do
    district = districts_by_count(:block)

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(200, Jason.encode!(district))
  end

  def fire_districts(conn, _params) do
    district = districts_by_count(:fire_district)

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(200, Jason.encode!(district))
  end

  def police_districts(conn, _params) do
    district = districts_by_count(:police_district)

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(200, Jason.encode!(district))
  end

  def sup_districts(conn, _params) do
    district = districts_by_count(:sup_district)

    conn
    |> Plug.Conn.put_resp_header("content-type", "application/json")
    |> Plug.Conn.send_resp(200, Jason.encode!(district))
  end

  defp set_status([]), do: 404
  defp set_status(_), do: 200

  defp map_and_approved_only(data) do
    data
      |> Enum.map(& &1)
      |> Enum.filter(&(&1.status == "APPROVED"))
  end

  defp districts_by_count(key) do
    FoodTruckCSV.get_all()
    |> map_and_approved_only()
    |> Enum.reduce(%{}, &Map.update(&2, Map.get(&1, key), [&1], fn l -> [&1 | l] end))
    |> Enum.sort(fn {_d1, a1}, {_d2, a2} -> Enum.count(a1) >= Enum.count(a2) end)
    |> Enum.map(fn {d, a} -> %{id: d, locations: Enum.sort(a)} end)
  end

  defp nil_district(district) do
    case district do
      "NULL" -> nil
      d ->d
    end
  end
end
