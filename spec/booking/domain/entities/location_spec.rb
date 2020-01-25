require "rails_helper"

RSpec.describe Booking::Domain::Entities::Location, type: :model do
  let(:location) { described_class.new(name: "LA", un_loc_code: "code") }

  it { expect(location.name).to eq "LA" }
  it { expect(location.un_loc_code).to eq "code" }
end
