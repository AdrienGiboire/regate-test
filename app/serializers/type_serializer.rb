class TypeSerializer < ActiveModel::Serializer
  attribute :name
  attribute :slot

  def slot
    object.pokemon_types.slot
  end
end
