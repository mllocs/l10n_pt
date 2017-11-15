portugal = Spree::Country.find_by_name('Portugal')
lisboa = Spree::State.find_by_name('Lisboa')

if portugal && !lisboa
  puts "[db:seed] Seeding Portugal statoids"

  statoids = [
    'Aveiro',
    'Azores',
    'Beja',
    'Braga',
    'Bragança',
    'Castelo',
    'Coimbra',
    'Évora',
    'Faro',
    'Guarda',
    'Leiria',
    'Lisboa',
    'Madeira',
    'Portalegre',
    'Porto',
    'Santarém',
    'Setúbal',
    'Viana do Castelo',
    'Vila',
    'Real',
    'Viseu'
  ]

  statoids.each do |state|
    Spree::State.create!({
      name: state,
      abbr: state,
      country: portugal
    }, without_protection: true)
  end
end
