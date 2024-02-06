require 'rails_helper'

RSpec.describe Favroute, type: :model do
  it { should belong_to(:user) }
  it { should belong_to(:property) }
end
