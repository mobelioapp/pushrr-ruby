require 'spec_helper'

describe Pushrr::Notification do
  context '#all' do
    before do
      VCR.use_cassette 'notifications' do
        domain_token = '93159b0efc2c83b87fed4af06b8236f5'
        domain = Pushrr::Domain.new(token: domain_token)
        @notification = Pushrr::Notification.all(domain)
      end
    end

    it { expect(@notification.count).to eq 57 }
    it { expect(@notification).to be_a Array }
    it { expect(@notification.sample).to be_a Pushrr::Notification }
  end
end
