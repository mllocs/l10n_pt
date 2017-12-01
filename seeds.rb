puts "[db:seed] Seeding states.yml"

states = YAML::load_file "db/default/spree/states.yml"

states.each do |state|
  spree_country = Spree::Country.find_by_id(state['country_id'])

  return unless spree_country

  spree_state = Spree::State.find_by_name(state['name'])

  return if spree_state

  Spree::State.create!({
    name: state['name'],
    abbr: state['abbr'],
    country: spree_country
  }, without_protection: true)
end
