# FoodTruck

To start your Phoenix server:

  * Run `mix setup` to install and setup dependencies
  * Start Phoenix endpoint with `mix phx.server` or inside IEx with `iex -S mix phx.server`

Now you can visit [`localhost:4000`](http://localhost:4000) from your browser using the following paths.
  * /api/all - gets all **approved** food facilities
  * /api/fire_districts - gets the **approved** food facilities grouped by fire district, sorted by the number of locations
  * /api/fire_district/:id - gets the **approved** food facilities for the specified fire district
  * /api/police_districts - gets the **approved** food facilities grouped by police district, sorted by the number of locations
  * /api/police_district/:id - gets the **approved** food facilities for the specified police district
  * /api/sup_districts - gets the **approved** food facilities grouped by supervisor district, sorted by the number of locations
  * /api/sup_district/:id - gets the **approved** food facilities for the specified supervisor district
  * /api/blocks - gets the **approved** food facilities grouped by assessor block, sorted by the number of locations
  * /api/block/:id - gets the **approved** food facilities for the specified assessor block

