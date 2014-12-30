FactoryGirl.define do
  sequence(:url) {|n| "http://www.example#{n}.com" }
  sequence(:url_id) {|n| "http://www.example#{n}.com" }
  sequence(:domain) {|n| "#{n}.example.com" }
  sequence(:domain_id) {|n| "SW-1%07d-1" % n }

  factory :test_model do
    url
    url_id
    domain
    domain_id
  end

  factory :test_model_attribute, class: TestModel do
    add_attribute(:url) { generate(:url) }
    add_attribute(:url_id) { generate(:url_id) }
    add_attribute(:domain) { generate(:domain) }
    add_attribute(:domain_id) { generate(:domain_id) }
  end

  factory :test_model_transient, class: TestModel do
    transient do
      url
      url_id
      domain
      domain_id
    end
    
    after(:build) do |test_model, evaluation|
      test_model.url ||= evaluation.url || generate(:url)
      test_model.url_id ||= evaluation.url_id || generate(:url_id)
      test_model.domain ||= evaluation.domain || generate(:domain)
      test_model.domain_id ||= evaluation.domain_id || generate(:domain_id)
    end
  end

  factory :test_class do
    url
    url_id
    domain
    domain_id
  end

  factory :test_class_attribute, class: TestClass do
    add_attribute(:url) { generate(:url) }
    add_attribute(:url_id) { generate(:url_id) }
    add_attribute(:domain) { generate(:domain) }
    add_attribute(:domain_id) { generate(:domain_id) }
  end

  factory :test_class_transient, class: TestClass do
    transient do
      url
      url_id
      domain
      domain_id
    end
    
    after(:build) do |test_class, evaluation|
      test_class.url ||= evaluation.url || generate(:url)
      test_class.url_id ||= evaluation.url_id || generate(:url_id)
      test_class.domain ||= evaluation.domain || generate(:domain)
      test_class.domain_id ||= evaluation.domain_id || generate(:domain_id)
    end
  end
end