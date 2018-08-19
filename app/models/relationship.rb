class Relationship < ApplicationRecord
  belongs_to :follower, class_name: "User" #falando que o follower é um usuário
  belongs_to :followed, class_name: "User"

end
