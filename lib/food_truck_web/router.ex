defmodule FoodTruckWeb.Router do
  use FoodTruckWeb, :router

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/api", FoodTruckWeb do
    pipe_through :api

    get "/all", ApiController, :all

    get "/block/:id", ApiController, :by_block
    get "/blocks", ApiController, :blocks

    get "/fire_district/:id", ApiController, :by_fire_district
    get "/fire_districts", ApiController, :fire_districts

    get "/police_district/:id", ApiController, :by_police_district
    get "/police_districts", ApiController, :police_districts

    get "/sup_district/:id", ApiController, :by_sup_district
    get "/sup_districts", ApiController, :sup_districts
  end
end
