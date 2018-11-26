module V1
  class ContactSerializer < ActiveModel::Serializer
    attributes :id, :name, :email, :birthdate #, :author

    belongs_to :kind do
      link(:related) { v1_contact_kind_url(object.id)}
    end

    has_many :phones do
      link(:related) { v1_contact_phones_url(object.id)}
    end

    has_one :address do
      link(:related) { v1_contact_address_url(object.id)}

    end

    # link(:self) { contact_url(object.id) }

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
end
