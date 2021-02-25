# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
puts 'Cleaning database ...'

Skill.delete_all
Instrument.delete_all
User.delete_all


puts 'Adding users ...'

asia = User.create(
  email: 'asia@gmail.com',
  password: 'password',
  )

lydia = User.create(
  email: 'lydia@gmail.com',
  password: 'password',
  )

dan = User.create(
  email: 'dan@gmail.com',
  password: 'password',
  )

zak = User.create(
  email: 'zak@gmail.com',
  password: 'ilovethemandolin',
  )

puts 'Adding instruments 🎵🎶 ...'

acoustic_guitar = Instrument.create(name: 'acoustic guitar')
electic_guitar = Instrument.create(name: 'electric guitar')
bass_guitar = Instrument.create(name: 'bass guitar')
violin = Instrument.create(name: 'violin')
viola = Instrument.create(name: 'viola')
cello = Instrument.create(name: 'cello')
double_bass = Instrument.create(name: 'double bass')
banjo = Instrument.create(name: 'banjo')
mandolin = Instrument.create(name: 'mandolin')
ukulele = Instrument.create(name: 'ukulele')
harp = Instrument.create(name: 'harp')
piano = Instrument.create(name: 'piano')
keyboard = Instrument.create(name: 'keyboard')
flute = Instrument.create(name: 'flute')
clarinet = Instrument.create(name: 'clarinet')
oboe = Instrument.create(name: 'oboe')
bassoon = Instrument.create(name: 'bassoon')
trumpet = Instrument.create(name: 'trumpet')
trombone = Instrument.create(name: 'trombone')
french_horn = Instrument.create(name: 'french horn')
tuba = Instrument.create(name: 'tuba')
saxophone = Instrument.create(name: 'saxophone')
drum_hit = Instrument.create(name: 'drum kit')
bongo_drums = Instrument.create(name: 'bongo drums')
piano = Instrument.create(name: 'piano')
vocals = Instrument.create(name: 'vocals')

puts 'Adding skills to users ...'

lydia.skills.create(instrument: piano)
lydia.skills.create(instrument: violin)

zak.skills.create(instrument: mandolin)
zak.skills.create(instrument: harp)

asia.skills.create(instrument: banjo)
asia.skills.create(instrument: ukulele)

dan.skills.create(instrument: acoustic_guitar)
dan.skills.create(instrument: saxophone)

puts 'Creating rehearsals ...'

dans_rehearsal = Rehearsal.create(organiser: dan, address: 'Royal Festival Hall, London', title: 'Dans Ninth Sympthony B Minor', description: 'Dans orchestra requires a violinist')
violin_role = Role.create(rehearsal: dans_rehearsal, instrument: violin)

lydias_rehearsal = Rehearsal.create(organiser: lydia, address: 'Stoke Newington, London', title: "Piano Duets", description: 'Come and play some really fun piano duets!')
piano_role = Role.create(rehearsal: lydias_rehearsal, instrument: piano)

puts 'Finished!'
