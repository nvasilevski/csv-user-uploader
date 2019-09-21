class ClientSerializer < ActiveModel::Serializer
  attributes :id, :firstname, :lastname, :phone, :email
end
