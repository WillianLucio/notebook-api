class Contact < ApplicationRecord
  belongs_to :kind#, optional: true
  # def author
  #   "Jackson Pires"
  # end
  #
  # def kind_description
  #   self.kind.description
  # end
  #
  # def as_json(options={})
  #   super(
  #     root:true,
  #     methods: %i(author kind_description),
  #     include: { kind: { only: :description } }
  #   )
  # end
end
