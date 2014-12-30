class TestModel
  include Mongoid::Document

  field :url, type: String
  field :url_id, type: String
  field :domain, type: String
  field :domain_id, type: String

  validates_presence_of :url, :url_id, :domain, :domain_id

  # def domain=(domain)
  #   puts 'DOMAIN CALLED:'
  #   p domain
  #   self[:domain] = domain
  # end

  # def domain_id=(domain_id)
  #   puts 'DOMAIN_ID CALLED:'
  #   p domain_id
  #   self[:domain_id] = domain_id
  # end
end
