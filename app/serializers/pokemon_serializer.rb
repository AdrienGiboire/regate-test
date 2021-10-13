class PokemonSerializer < ActiveModel::Serializer
  attribute :id
  attribute :name
  attribute :base_experience
  attribute :height
  attribute :is_default
  attribute :order
  attribute :weight

  has_many :types
end
