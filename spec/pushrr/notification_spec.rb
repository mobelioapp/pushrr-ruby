require 'spec_helper'

describe Pushrr::Notification do
  before do
    token = '93159b0efc2c83b87fed4af06b8236f5'
    @domain = Pushrr::Domain.new(token: token)
  end

  context '#all' do
    before do
      VCR.use_cassette 'notifications' do
        @notification = Pushrr::Notification.all(@domain)
      end
    end

    it { expect(@notification.count).to eq 7 }
    it { expect(@notification).to be_a Array }
    it { expect(@notification.sample).to be_a Pushrr::Notification }
  end

  context '#create' do
    before do
      VCR.use_cassette 'new_notification' do
        params = {
          domain: @domain,
          title:  'title',
          text:   'text',
          url:    'google.com',
          country_codes: ['ID']
        }

        @notification = Pushrr::Notification.create(params)
      end
    end

    it do
      expect(@notification).to be_a Pushrr::Notification
    end
  end
end
