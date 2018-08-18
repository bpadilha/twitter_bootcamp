class Tweet < ApplicationRecord
  belongs_to :user
  validates :content, presence: true #verificando se o tweet esta vazio
end
