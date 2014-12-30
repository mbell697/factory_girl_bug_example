require 'spec_helper'

describe TestClass do
  describe 'normal factory' do 
    context 'when setting all values' do
      it 'sets the attributes' do
        model = build(:test_class, url: 'http://test.com', url_id: 'FE-3424-2342', domain: 'test.com', domain_id: 'FE-342342-3242')
        p model # Note all 4 fields are nil
        expect(model.url).to eq 'http://test.com'
        expect(model.url_id).to eq 'FE-3424-2342'
        expect(model.domain).to eq 'test.com'
        expect(model.domain_id).to eq 'FE-342342-3242'
      end
    end

    context 'when setting no values' do
      it 'creates a valid model' do
        model = build(:test_class)
        p model # All 4 fields are set
        expect(model.valid?).to be true
      end
    end

    context 'when setting one half of a pair' do
      it 'sets the attributes' do
        model = build(:test_class, domain: 'test.com', url_id: 'FE-342432-2342')
        p model # Both fields are set
        expect(model.domain).to eq 'test.com'
        expect(model.url_id).to eq 'FE-342432-2342'
      end
    end
  end

  describe 'attribute facotry' do
    context 'when setting all values' do
      it 'sets the attributes' do
        model = build(:test_class_attribute, url: 'http://test.com', url_id: 'FE-3424-2342', domain: 'test', domain_id: 'FE-342342-3242')
        expect(model.url).to eq 'http://test.com'
        expect(model.url_id).to eq 'FE-3424-2342'
        expect(model.domain).to eq 'test'
        expect(model.domain_id).to eq 'FE-342342-3242'
      end
    end

    context 'when setting no values' do
      it 'creates a valid model' do
        model = build(:test_class_attribute)
        expect(model.valid?).to be true
      end
    end

    context 'when setting one half of a pair' do
      it 'sets the attributes' do
        model = build(:test_class_attribute, domain: 'test.com', url_id: 'FE-342432-2342')
        expect(model.domain).to eq 'test.com'
        expect(model.url_id).to eq 'FE-342432-2342'
      end
    end
  end

  describe 'transient facotry' do
    context 'when setting all values' do
      it 'sets the attributes' do
        model = build(:test_class_transient, url: 'http://test.com', url_id: 'FE-3424-2342', domain: 'test.com', domain_id: 'FE-342342-3242')
        expect(model.url).to eq 'http://test.com'
        expect(model.url_id).to eq 'FE-3424-2342'
        expect(model.domain).to eq 'test.com'
        expect(model.domain_id).to eq 'FE-342342-3242'
      end
    end

    context 'when setting no values' do
      it 'creates a valid model' do
        model = build(:test_class_transient)
        expect(model.valid?).to be true
      end
    end

    context 'when setting one half of a pair' do
      it 'sets the attributes' do
        model = build(:test_class_transient, domain: 'test.com', url_id: 'FE-342432-2342')
        expect(model.domain).to eq 'test.com'
        expect(model.url_id).to eq 'FE-342432-2342'
      end
    end
  end
end
