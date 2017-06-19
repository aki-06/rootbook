# コメント
60.times do
  user_id = [*1..20].sample
  topic_id = [*1..20].sample
  content = Yoshida::Text.sentence
  Comment.create!(
    user_id: user_id,
    topic_id: topic_id,
    content: content
  )
end

# ユーザー
# 20.times do
#   email = Faker::Internet.email
#   name = Faker::Name.name
#   password = "password"
#   num = format('%03d', [*001..141].sample)
#   image_url = "http://towncat.yokochou.com/images/#{num}.jpg"
#   user = User.new(
#           email: email,
#           name: name,
#           password: password,
#           password_confirmation: password,
#           uid: SecureRandom.uuid,
#           image_url: image_url
#         )
#   user.skip_confirmation!
#   user.save
# end

# #Topic
# 20.times do
#   user_id = [*1..20].sample
#   title = Yoshida::Text.sentences(4).join
#   content = Yoshida::Text.sentences(4).join
#   num = format('%03d', [*001..141].sample)
#   image = "http://towncat.yokochou.com/images/#{num}.jpg"
#   Topic.create!(
#     user_id: user_id,
#     title: title,
#     content: content,
#     image: image
#   )
# end