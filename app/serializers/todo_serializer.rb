class TodoSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :id_square

  def id_square
    item = self.object.id.to_i
    item * item
  end
end
