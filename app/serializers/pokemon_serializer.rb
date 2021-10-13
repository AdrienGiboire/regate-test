class PokemonSerializer < ActiveModel::Serializer
  include Rails.application.routes.url_helpers

  attribute :id
  attribute :name
  attribute :base_experience
  attribute :height
  attribute :is_default
  attribute :order
  attribute :weight
  attribute :url

  has_many :types do
    object.types.map do |type|
      TypeSerializer.new(type).serializable_hash.merge(
        slot: object.pokemon_types.where(type_id: type.id).first.slot
      )
    end
  end

  def url
    api_pokemon_show_url(object.id)
  end
end
