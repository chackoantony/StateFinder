require 'rails_helper'

RSpec.describe StateChange, type: :model do

  it 'Validates changed_at' do
    expect(StateChange.new(changed_at: nil).valid?).to eq false
  end

  it 'Validates changed_values' do
    expect(StateChange.new(changed_values: nil).valid?).to eq false
  end

  describe '#import' do
    it 'Imports data from csv file' do
      file = File.open("#{Rails.root}/spec/sample_files/state_data.csv")
      StateChange.import(file)
      expect(StateChange.count).to eq 7
    end
  end
  
end
