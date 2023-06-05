defmodule FoodTruckCSV do
  @moduledoc """
  Schema for mobile food facility permits.
  """
  use Csv.Schema, separator: ?,

  import Csv.Schema.Parser

  @derive {Jason.Encoder,
           only: [
             :location_id,
             :applicant,
             :facility_type,
             :location_desc,
             :address,
             :permit,
             :status,
             :food_items,
             :approved,
             :exp_date,
             :location,
             :fire_district,
             :police_district,
             :sup_district,
             :zip_code
           ]}

  schema "priv/static/Mobile_Food_Facility_Permit.csv" do
    field(:location_id, "locationid", key: true, parser: &integer!/1)
    field(:applicant, "Applicant", filter_by: true)
    field(:facility_type, "FacilityType", filter_by: true)
    field(:cnn, "cnn", parser: &integer!/1)
    field(:location_desc, "LocationDescription")
    field(:address, "Address")
    field(:block_lot, "blocklot")
    field(:block, "block", filter_by: true)
    field(:lot, "lot")
    field(:permit, "permit")
    field(:status, "Status")
    field(:food_items, "FoodItems")
    field(:x, "X", parser: &float!/1)
    field(:y, "Y", parser: &float!/1)
    field(:latitude, "Latitude", float: &integer!/1)
    field(:longitude, "Longitude", float: &integer!/1)
    field(:schedule, "Schedule")
    field(:days_hours, "dayshours")
    field(:noi_sent, "NOISent")
    field(:approved, "Approved", parser: &date!(&1, "{0M}/{0D}/{0YYYY} {h12}:{m}:{s} {AM}"))
    field(:received, "Received", parser: &date!(&1, "{YYYY}{0M}{0D}"))
    field(:prior_permit, "PriorPermit")
    field(:exp_date, "ExpirationDate", parser: &date!(&1, "{0M}/{0D}/{0YYYY} {h12}:{m}:{s} {AM}"))
    field(:location, "Location")
    field(:fire_district, "Fire Prevention Districts", filter_by: true)
    field(:police_district, "Police Districts", filter_by: true)
    field(:sup_district, "Supervisor Districts", filter_by: true)
    field(:zip_code, "Zip Codes")
    field(:neighborhood, "Neighborhoods (old)")
  end
end
