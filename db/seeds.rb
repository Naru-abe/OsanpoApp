# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Admin.create!(
  [
    {email: 'admin@test.com', password: 'password'}
  ]
)

tags = Tag.create!(
  [
    {name: 'きれい'},
    {name: 'いやし'},
    {name: 'たのしい'},
    {name: 'おもしろい'},
    {name: 'おしゃれ'},
    {name: 'かわいい'},
    {name: 'かっこいい'},
    {name: 'おいしい'}
  ]
)

users = EndUser.create!(
  [
    {email: 'olivia@test.com', name: 'Olivia', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user1.jpg"), filename:"sample-user1.jpg")},
    {email: 'james@test.com', name: 'James', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user2.jpg"), filename:"sample-user2.jpg")},
    {email: 'lucas@test.com', name: 'Lucas', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user3.jpg"), filename:"sample-user3.jpg")},
    {email: 'leo@test.com', name: 'leo', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user4.jpg"), filename:"sample-user4.jpg")},
    {email: 'max@test.com', name: 'max', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user5.jpg"), filename:"sample-user5.jpg")},
    {email: 'joe@test.com', name: 'joe', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user6.jpg"), filename:"sample-user6.jpg")},
    {email: 'roy@test.com', name: 'roy', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user7.jpg"), filename:"sample-user7.jpg")},
    {email: 'ace@test.com', name: 'ace', password: 'password', profile_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-user8.jpg"), filename:"sample-user8.jpg")}
  ]
)

Post.create!(
  [
    {end_user_id: users[0].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post1.jpg"), filename:"sample-post1.jpg"), content: 'しゃぼんだまとんでない〜。宇部空港芝生広場にて。', address: '山口宇部空港', tag_id: tags[0].id, station_name: '草江駅'},
    {end_user_id: users[1].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post2.jpg"), filename:"sample-post2.jpg"), content: '海は広いな大きいな', address: 'きららビーチ焼野', tag_id: tags[1].id, station_name: '雀田駅'},
    {end_user_id: users[2].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post3.jpg"), filename:"sample-post3.jpg"), content: 'ワンマン列車が通ります。この列車は1両編成で終電宇部新川駅まで各駅に停車します。', address: 'セルプときわ', tag_id: tags[2].id, station_name: '草江駅'},
    {end_user_id: users[3].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post4.jpg"), filename:"sample-post4.jpg"), content: 'みどりがしげる', address: '宇部新川駅', tag_id: tags[1].id, station_name: '宇部新川駅'},
    {end_user_id: users[4].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post5.jpg"), filename:"sample-post5.jpg"), content: '3番線に列車が参ります。あのシーンを思い出す。', address: '宇部新川駅', tag_id: tags[2].id, station_name: '宇部新川駅'},
    {end_user_id: users[5].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post6.jpg"), filename:"sample-post6.jpg"), content: 'エヴァ聖地といえばここ！', address: '宇部新川駅', tag_id: tags[2].id, station_name: '宇部新川駅'},
    {end_user_id: users[6].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post7.jpg"), filename:"sample-post7.jpg"), content: 'さらば、全てのエヴァンゲリオン。', address: '宇部新川駅', tag_id: tags[2].id, station_name: '宇部新川駅'},
    {end_user_id: users[7].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post8.jpg"), filename:"sample-post8.jpg"), content: '線路は続くよどこまでも。僕の旅も続くよどこまでも。', address: '新山口駅', tag_id: tags[6].id, station_name: '新山口駅'},
    {end_user_id: users[5].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post9.jpg"), filename:"sample-post9.jpg"), content: '給食で食べた味が懐かしい。', address: '宇部駅', tag_id: tags[7].id, station_name: '宇部駅'},
    {end_user_id: users[2].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post10.jpg"), filename:"sample-post10.jpg"), content: '山口土産はこれで決まり！獺祭しか勝たん！', address: '居能駅', tag_id: tags[7].id, station_name: '居能駅'},
    {end_user_id: users[4].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post11.jpg"), filename:"sample-post11.jpg"), content: 'ぶるーだいありー', address: '山口宇部空港', tag_id: tags[0].id, station_name: '草江駅'},
    {end_user_id: users[1].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post12.jpg"), filename:"sample-post12.jpg"), content: 'ここは日本？', address: 'きららビーチ焼野', tag_id: tags[0].id, station_name: '雀田駅'},
    {end_user_id: users[0].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post13.jpg"), filename:"sample-post13.jpg"), content: '2人が駆け上がったあの階段。', address: '宇部新川駅', tag_id: tags[2].id, station_name: '宇部新川駅'},
    {end_user_id: users[3].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post14.jpg"), filename:"sample-post14.jpg"), content: 'あぁテトラポッド登って〜', address: '草江駅', tag_id: tags[2].id, station_name: '草江駅'},
    {end_user_id: users[6].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post15.jpg"), filename:"sample-post15.jpg"), content: 'サラダはおかわり自由です', address: '宇部新川駅', tag_id: tags[7].id, station_name: '宇部新川駅'},
    {end_user_id: users[6].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post16.jpg"), filename:"sample-post16.jpg"), content: 'パンもおかわりできます', address: '宇部新川駅', tag_id: tags[7].id, station_name: '宇部新川駅'},
    {end_user_id: users[6].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post17.jpg"), filename:"sample-post17.jpg"), content: 'レモンカルボナーラ美味しすぎた。＠NEWTOWN CAFE', address: '宇部新川駅', tag_id: tags[7].id, station_name: '宇部新川駅'},
    {end_user_id: users[6].id, post_image: ActiveStorage::Blob.create_and_upload!(io: File.open("#{Rails.root}/db/fixtures/sample-post18.jpg"), filename:"sample-post18.jpg"), content: 'NEWTOWN CAFE', address: '宇部新川駅', tag_id: tags[7].id, station_name: '宇部新川駅'},
  ]
)
