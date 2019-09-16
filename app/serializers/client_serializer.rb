class ClientSerializer
  include FastJsonapi::ObjectSerializer

  attributes :firstname, :lastname, :phone, :email
end
