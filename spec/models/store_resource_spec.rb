require 'rails_helper'

RSpec.describe StoreResource, type: :model do

  it 'Validates resource_type' do
    expect(StoreResource.new(resource_type: nil).valid?).to eq false
  end

  it 'Validates resource_id' do
    expect(StoreResource.new(resource_type: 'Product', resource_id: nil).valid?).to eq false
  end

  it 'Validates uniqueness of resource_type and resource_id' do
    create(:store_resource, resource_type: 'Product', resource_id: 1)
    expect(StoreResource.new(resource_type: 'Product', resource_id: 1).valid?).to eq false
  end

  describe '.state_at' do
    
    before(:each) do
      @resource = create(:store_resource, resource_id: 1)
      change_one = create(:state_change, changed_at: (Time.now - 1.day), changed_values: {status: 'unpaid', name: 'someone'}, store_resource_id: @resource.id)
      change_two = create(:state_change, changed_at: (Time.now - 1.hour), changed_values: {status: 'paid', name: 'someone', address: 'sample address'}, store_resource_id: @resource.id)
    end

    it 'Returns state of an object at current time' do
      state = @resource.state_at(DateTime.now.to_s)
      expect(state).to eq({'status' => 'paid', 'name' => 'someone', 'address'  => 'sample address'})
    end

    it 'Returns empty state when object not existed' do
      state = @resource.state_at((DateTime.now - 2.day).to_s)
      expect(state).to eq({})
    end
  end
    
end
