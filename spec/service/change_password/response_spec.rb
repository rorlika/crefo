require 'spec_helper'

describe Crefo::Service::ChangePassword::Response do
  let(:response_body) { vcr_reponse_body(:change_password) }

  subject { described_class.new(response_body) }

  describe '#result' do
    it 'returns the result objects' do
      expect(subject.result).to eq true
    end
  end
end
