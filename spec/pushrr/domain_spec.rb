require 'spec_helper'

describe Pushrr::Domain do
  context '#all' do
    before do
      VCR.use_cassette 'domains' do
        @domains = Pushrr::Domain.all
      end
    end

    it { expect(@domains.length).to eq 3 }
    it { expect(@domains).to be_a Array }
    it { expect(@domains.sample).to be_a Pushrr::Domain }
  end

  context '#find' do
    before do
      VCR.use_cassette 'domain' do
        token = '93159b0efc2c83b87fed4af06b8236f5'
        @domain = Pushrr::Domain.find(token)
      end
    end
    it { expect(@domain).to be_a Pushrr::Domain }
  end

  context '#create' do
    before do
      VCR.use_cassette 'new_domain' do
        @domain = Pushrr::Domain.create(host: 'uniq.com')
      end
    end

    it { expect(@domain).to be_a Pushrr::Domain }
  end
end
