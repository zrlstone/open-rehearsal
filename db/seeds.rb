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
acoustic_guitar.photo.attach(io: URI.open('app/assets/images/acoustic_guitar.svg'), filename: 'acoustic_guitar.svg', content_type: 'image/svg')
electric_guitar = Instrument.create(name: 'electric guitar')
electric_guitar.photo.attach(io: URI.open('app/assets/images/electric_guitar.svg'), filename: 'electric_guitar.svg', content_type: 'image/svg')
bass_guitar = Instrument.create(name: 'bass guitar')
bass_guitar.photo.attach(io: URI.open('app/assets/images/bass_guitar.svg'), filename: 'bass_guitar.svg', content_type: 'image/svg')
violin = Instrument.create(name: 'violin')
violin.photo.attach(io: URI.open('app/assets/images/violin.svg'), filename: 'violin.svg', content_type: 'image/svg')
viola = Instrument.create(name: 'viola')
viola.photo.attach(io: URI.open('app/assets/images/viola.svg'), filename: 'viola.svg', content_type: 'image/svg')
cello = Instrument.create(name: 'cello')
cello.photo.attach(io: URI.open('app/assets/images/cello.svg'), filename: 'cello.svg', content_type: 'image/svg')
puts 'Tuning strings'
double_bass = Instrument.create(name: 'double bass')
double_bass.photo.attach(io: URI.open('app/assets/images/double_bass.svg'), filename: 'double_bass.svg', content_type: 'image/svg')
banjo = Instrument.create(name: 'banjo')
banjo.photo.attach(io: URI.open('app/assets/images/banjo.svg'), filename: 'banjo.svg', content_type: 'image/svg')
mandolin = Instrument.create(name: 'mandolin')
mandolin.photo.attach(io: URI.open('app/assets/images/mandolin.svg'), filename: 'mandolin.svg', content_type: 'image/svg')
ukulele = Instrument.create(name: 'ukulele')
ukulele.photo.attach(io: URI.open('app/assets/images/ukulele.svg'), filename: 'ukulele.svg', content_type: 'image/svg')
harp = Instrument.create(name: 'harp')
harp.photo.attach(io: URI.open('app/assets/images/harp.svg'), filename: 'harp.svg', content_type: 'image/svg')
puts 'Replacing reeds'
piano = Instrument.create(name: 'piano')
piano.photo.attach(io: URI.open('app/assets/images/piano.svg'), filename: 'piano.svg', content_type: 'image/svg')
keyboard = Instrument.create(name: 'keyboard')
keyboard.photo.attach(io: URI.open('app/assets/images/keyboard.svg'), filename: 'keyboard.svg', content_type: 'image/svg')
flute = Instrument.create(name: 'flute')
flute.photo.attach(io: URI.open('app/assets/images/flute.svg'), filename: 'flute.svg', content_type: 'image/svg')
clarinet = Instrument.create(name: 'clarinet')
clarinet.photo.attach(io: URI.open('app/assets/images/clarinet.svg'), filename: 'clarinet.svg', content_type: 'image/svg')
puts 'do, re, mi, fa, sol, la, si'
oboe = Instrument.create(name: 'oboe')
oboe.photo.attach(io: URI.open('app/assets/images/oboe.svg'), filename: 'oboe.svg', content_type: 'image/svg')
bassoon = Instrument.create(name: 'bassoon')
bassoon.photo.attach(io: URI.open('app/assets/images/bassoon.svg'), filename: 'bassoon.svg', content_type: 'image/svg')
trumpet = Instrument.create(name: 'trumpet')
trumpet.photo.attach(io: URI.open('app/assets/images/trumpet.svg'), filename: 'trumpet.svg', content_type: 'image/svg')
trombone = Instrument.create(name: 'trombone')
trombone.photo.attach(io: URI.open('app/assets/images/trombone.svg'), filename: 'trombone.svg', content_type: 'image/svg')
french_horn = Instrument.create(name: 'french horn')
french_horn.photo.attach(io: URI.open('app/assets/images/french_horn.svg'), filename: 'french_horn.svg', content_type: 'image/svg')
tuba = Instrument.create(name: 'tuba')
tuba.photo.attach(io: URI.open('app/assets/images/tuba.svg'), filename: 'tuba.svg', content_type: 'image/svg')
saxophone = Instrument.create(name: 'saxophone')
saxophone.photo.attach(io: URI.open('app/assets/images/saxophone.svg'), filename: 'saxophone.svg', content_type: 'image/svg')
drum_kit = Instrument.create(name: 'drum kit')
drum_kit.photo.attach(io: URI.open('app/assets/images/drum_kit.svg'), filename: 'drum_kit.svg', content_type: 'image/svg')
bongo_drums = Instrument.create(name: 'bongo drums')
bongo_drums.photo.attach(io: URI.open('app/assets/images/bongo_drums.svg'), filename: 'bongo_drums.svg', content_type: 'image/svg')
vocals = Instrument.create(name: 'vocals')
vocals.photo.attach(io: URI.open('app/assets/images/microphone.svg'), filename: 'microphone.svg', content_type: 'image/svg')

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


puts 'Opening rehearsals ...'

march_first = DateTime.new(2021, 03, 01, 20)
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
