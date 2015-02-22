# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

stocks = Stock.create([{symbol: 'SPY', name:'SPDR S&P 500 ET',exchange:'Nasdaq'},{symbol: 'IWM', name:'ISHARES RUSSELL 2000 ETF',exchange:'Nasdaq'},
{symbol: 'GLD', name:'SPDR GOLD TRUST',exchange:'Nasdaq'},{symbol: 'HACK', name:'PUREFUNDS ISE CYBER SECURITY',exchange:'Nasdaq'},
{symbol: 'XLF', name:'Financial Select Sector SPDR ETF',exchange:'Nasdaq'},{symbol: 'QQQ', name:'PowerShares QQQ',exchange:'Nasdaq'},{symbol: 'DVY', name:'iShares Select Dividend',exchange:'Nasdaq'}, 
{symbol: 'DIA', name:'SPDR Dow Jones Industrial Average ETF',exchange:'Nasdaq'},{symbol: 'PEJ', name:'PowerShares Dynamic Leisure & Entmnt ETF',exchange:'Nasdaq'}])


