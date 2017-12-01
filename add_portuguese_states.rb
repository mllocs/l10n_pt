# This mimics an ActiveRecord migration. We don't want to open a PR in OFN that
# could take ages just to change the data of our particular instance.
#
# This is just a workaround, while we figure out how to have data migrations
# with a shared codebase.
class AddPortugueseStates
  def up
    states = YAML::load_file "./states.yml"

    states.each do |state|
      spree_country = Spree::Country.find_by_id(state['country_id'])

      return unless spree_country

      spree_state = Spree::State.find_by_name(state['name'])

      return if spree_state

      puts "Creating #{state['name']}"

      Spree::State.create!({
        name: state['name'],
        abbr: state['abbr'],
        country: spree_country
      }, without_protection: true)
    end

    puts "Done!"
  end
end

AddPortugueseStates.new.up
