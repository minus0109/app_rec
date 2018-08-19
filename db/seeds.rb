# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#APIで取得できるデータを初期化
Gameasp.where(api: true).update(price: 0)

require 'net/http'
require 'uri'
require 'json'

#gamefeat ios
uri = URI.parse('https://www.gamefeat.net/services/webapi/v1/requestSiteAdsArticle?siteId=18331&apiKey=f6aeff27b&platform=ios')
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換
gamefeatios = result['result']['lists']

gamefeatios.each do |data|
  if data['tagNongame'] == false
    db = Gameasp.find_or_initialize_by(appid: data['appId'])

    db.update_attributes(
      appid:      data['appId'],
      name:       data['appName'],
      identifier: data['appStoreId'],
      price:      data['adRewardPrice'],
      url:        data['appUrl'],
      api:        true,
      platform:   "ios"
    )
  end
end

#gamefeat android
uri = URI.parse('https://www.gamefeat.net/services/webapi/v1/requestSiteAdsArticle?siteId=18331&apiKey=f6aeff27b&platform=android')
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換
gamefeatandroid = result['result']['lists']

gamefeatandroid.each do |data|
  if data['tagNongame'] == false
    db = Gameasp.find_or_initialize_by(appid: data['appId'])

    db.update_attributes(
      appid:      data['appId'],
      name:       data['appName'],
      identifier: data['appStoreId'],
      price:      data['adRewardPrice'],
      url:        data['appUrl'],
      api:        true,
      platform:   "android"
    )
  end
end

#zucks ios
uri = URI.parse('https://get.mobu.jp/api/ads/3.3/?pcode=app-rec&device=ios')
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換
maxpage = result['adSearch']['ads']['maxPage'].to_i
for i in 1..maxpage do
  uri = URI.parse("https://get.mobu.jp/api/ads/3.3/?pcode=app-rec&device=ios&page=#{i}")
  json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
  result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換

  zucksios = result['adSearch']['ads']['ad']
  zucksios.each do |data|
    if data['type'] == 'app'
      db = Gameasp.find_or_initialize_by(appid: data['id'])

      db.update_attributes(
        appid:  data['id'],
        name:   data['title'],
        identifier: data['app_identifier'],
        price:  data['unit_price'],
        url:    data['url'],
        api:        true,
        platform:   "ios"
      )
    end
  end
end

#android
uri = URI.parse('https://get.mobu.jp/api/ads/3.3/?pcode=app-rec&device=android')
json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換
maxpage = result['adSearch']['ads']['maxPage'].to_i
for i in 1..maxpage do
  uri = URI.parse("https://get.mobu.jp/api/ads/3.3/?pcode=app-rec&device=android&page=#{i}")
  json = Net::HTTP.get(uri) #NET::HTTPを利用してAPIを叩く
  result = JSON.parse(json) #返ってきたjsonデータをrubyの配列に変換

  zucksandroid = result['adSearch']['ads']['ad']
  zucksandroid.each do |data|
    if data['type'] == 'app'
      db = Gameasp.find_or_initialize_by(appid: data['id'])

      db.update_attributes(
        appid:  data['id'],
        name:   data['title'],
        identifier: data['app_identifier'],
        price:  data['unit_price'],
        url:    data['url'],
        api:        true,
        platform:   "android"
      )
    end
  end
end

#gameに登録
gameasps = Gameasp.all.order("name").to_a.uniq { |item| item.identifier }

gameasps.each do |data|
  db = Game.find_or_initialize_by(name: data.name)

  db.update_attributes(
    name:   data.name
  )
end
