class ContactSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :birthdate #, :author

  belongs_to :kind
  has_many :phones
  has_one :address

  # def author
  #   "Jackson Pires"
  # end

  meta do
    { autor: "Jackson Pires" }
  end

  def attributes(*args)
    h = super(*args)
    h[:birthdate] = object.birthdate.to_time.iso8601 unless self.object.blank?# pt-BR (I18n.l(object.birthdate) )
    h
  end
end
