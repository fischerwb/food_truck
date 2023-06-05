defmodule FoodTruckCSVTest do
  use ExUnit.Case

  alias FoodTruckCSV

  @moduletag :capture_log

  test "module exists" do
    assert is_list(FoodTruckCSV.module_info())
  end

  test "get all" do
    fts = FoodTruckCSV.get_all()
    refute Enum.empty?(fts)
    assert Enum.count(fts) == 481
  end

  test "get by location_id" do
    ft = FoodTruckCSV.by_location_id(1_660_555)
    assert ft
    assert ft.applicant == "Bay Area Mobile Catering, Inc. dba. Taqueria Angelica's"
  end

  test "filter by block" do
    fts = FoodTruckCSV.filter_by_block("5242")
    refute Enum.empty?(fts)
    assert Enum.count(fts) == 2
  end

  test "filter by fire district" do
    fts = FoodTruckCSV.filter_by_fire_district("9")
    refute Enum.empty?(fts)
    assert Enum.count(fts) == 6
  end

  test "filter by police_district" do
    fts = FoodTruckCSV.filter_by_police_district("5")
    refute Enum.empty?(fts)
    assert Enum.count(fts) == 8
  end

  test "filter by supervisor district" do
    fts = FoodTruckCSV.filter_by_sup_district("6")
    refute Enum.empty?(fts)
    assert Enum.count(fts) == 5
  end
end
