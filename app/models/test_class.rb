class TestClass
  attr_accessor :url, :url_id, :domain, :domain_id

  def valid?
    [@url, @url_id, @domain, @domain_id].all? { |a| a }
  end
end
