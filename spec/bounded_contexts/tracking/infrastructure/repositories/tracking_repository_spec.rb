require "rails_helper"

module Tracking
  module Infrastructure
    module Repositories
      describe TrackingRepository, type: :model do
        let(:repo) { TrackingRepository.new }
      end
    end
  end
end
