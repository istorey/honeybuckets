# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Location.destroy_all
locations = Location.create([{lat: 38.8893, long: -77.0501, name: 'Lincoln Memorial', address: '2 Lincoln Memorial Northwest Washington, D.C. 20037'},
	{lat: 38.8915 , long: -77.0200, name: 'National Gallery', address: '6th & Constitution Ave NW, Washington, DC 20565'},
	{lat: 38.8972, long: -77.0642, name: 'Theodore Roosevelt Island', address: 'George Washington Pkwy Arlington, VA 22164'},
	{lat: 38.9222, long: -77.0194, name: 'Howard University', address: '2400 Sixth St NW, Washington, DC 20059'},
	{lat: 38.8886, long: -77.0047, name: 'Library of Congress', address: '101 Independence Avenue Southeast, Washington, DC 20540'}])
