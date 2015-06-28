Geocoder.configure(lookup: :test)

Geocoder::Lookup::Test.add_stub('18512', [
  {
    'latitude' => 40.7143528,
    'longitude' => -74.0059731,
    'address' => 'Scranton, PA, USA',
    'city' => 'Scranton',
    'state' => 'Pennsylvania',
    'state_code' => 'PA',
    'country' => 'United States',
    'country_code' => 'US'
  }
])
