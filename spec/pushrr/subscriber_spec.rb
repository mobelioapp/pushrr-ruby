require 'spec_helper'

describe Pushrr::Subscriber do
  context '#all' do
    before do
      VCR.use_cassette 'subscribers' do
        domain_token = '93159b0efc2c83b87fed4af06b8236f5'
        domain = Pushrr::Domain.find(domain_token)
        @subscribers = Pushrr::Subscriber.all(domain)
      end
    end

    it { expect(@subscribers.count).to eq 1 }
    it { expect(@subscribers).to be_a Array }
    it { expect(@subscribers.sample).to be_a Pushrr::Subscriber }
  end
end
