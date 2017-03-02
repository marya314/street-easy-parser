require 'spec_helper'

describe MyLib do
  it 'has a version number' do
    expect(MyLib::VERSION).not_to be nil
  end

  it 'does something useful' do
    expect(false).to eq(true)
  end
end
