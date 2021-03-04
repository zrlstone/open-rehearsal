# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'date'

puts 'Cleaning database ...'

Request.delete_all
Role.delete_all
Rehearsal.delete_all
Skill.delete_all
User.delete_all
Instrument.delete_all

puts 'Adding users ...'

asia = User.create(
  email: 'asia@gmail.com',
  password: 'password',
  username: 'asia123'
  )

lydia = User.create(
  email: 'lydia@gmail.com',
  password: 'password',
  username: 'lydia123'
  )

dan = User.create(
  email: 'dan@gmail.com',
  password: 'password',
  username: 'dan123'
  )

zak = User.create(
  email: 'zak@gmail.com',
  password: 'ilovethemandolin',
  username: 'mandolinzak'
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
drum_kit = Instrument.create(name: 'drum kit')
bongo_drums = Instrument.create(name: 'bongo drums')
vocals = Instrument.create(name: 'vocals')

puts 'Adding skills to users ...'

lydia.skills.create(instrument: piano)
lydia.skills.create(instrument: violin)
lydia.skills.create(instrument: drum_kit)

zak.skills.create(instrument: mandolin)
zak.skills.create(instrument: harp)
zak.skills.create(instrument: cello)
zak.skills.create(instrument: piano)


asia.skills.create(instrument: banjo)
asia.skills.create(instrument: ukulele)
asia.skills.create(instrument: piano)

dan.skills.create(instrument: acoustic_guitar)
dan.skills.create(instrument: saxophone)
dan.skills.create(instrument: piano)

puts 'Creating rehearsals ...'

apr_first = DateTime.new(2021, 04, 01, 19)
may_first = DateTime.new(2021, 05, 01, 20, 30)
june_first = DateTime.new(2021, 06, 01, 20)

dans_rehearsal = Rehearsal.create!(organiser: dan, address: 'Royal Festival Hall, London', title: 'Symphony in B Minor', description: 'More players needed!', date_time: apr_first)
Role.create(rehearsal: dans_rehearsal, instrument: saxophone, user: dan)
Role.create(rehearsal: dans_rehearsal, instrument: violin)
Role.create(rehearsal: dans_rehearsal, instrument: harp)
Role.create(rehearsal: dans_rehearsal, instrument: banjo)

lydias_rehearsal = Rehearsal.create!(organiser: lydia, address: 'Stoke Newington, London', title: "Piano Duets", description: 'Come and play some really fun piano duets!', date_time: apr_first)
Role.create(rehearsal: lydias_rehearsal, instrument: piano, user: lydia)
Role.create(rehearsal: lydias_rehearsal, instrument: piano)

zaks_rehearsal = Rehearsal.create!(organiser: zak, address: 'Farringdon, London', title: "Mandolin and ukulele ensemble", description: 'Hoping to see lots of strummers there!', date_time: may_first)
Role.create(rehearsal: zaks_rehearsal, instrument: mandolin, user: zak)
Role.create(rehearsal: zaks_rehearsal, instrument: ukulele)

asia_rehearsal = Rehearsal.create!(organiser: asia, address: 'Shoreditch', title: "Country music jam", description: "Looking for other country music fans to jam with", date_time: apr_first)
Role.create(rehearsal: asia_rehearsal, instrument: banjo, user: asia)
Role.create(rehearsal: asia_rehearsal, instrument: acoustic_guitar)
Role.create(rehearsal: asia_rehearsal, instrument: mandolin)
Role.create(rehearsal: asia_rehearsal, instrument: violin)

string_quartets = Rehearsal.create!(organiser: lydia, address: 'London N16', title: "Mozart String Quartets", description: "Looking for string players to play through some Mozart string quartets", date_time: apr_first)
Role.create(rehearsal: string_quartets, instrument: violin, user: lydia)
Role.create(rehearsal: string_quartets, instrument: violin)
Role.create(rehearsal: string_quartets, instrument: viola)
Role.create(rehearsal: string_quartets, instrument: cello)

jazz_quartet = Rehearsal.create!(organiser: dan, address: 'Hoxton', title: "Jazz Quartet standards", description: "Looking forward to meeting a pianist, drummer and bass player to rehearse with", date_time: june_first)
Role.create(rehearsal: jazz_quartet, instrument: saxophone, user: dan)
Role.create(rehearsal: jazz_quartet, instrument: piano)
Role.create(rehearsal: jazz_quartet, instrument: double_bass)
Role.create(rehearsal: jazz_quartet, instrument: drum_kit)


puts 'Finished!'
