# -*- encoding: utf-8 -*-
require 'spec_helper'

describe KewegoParty::Client::Video do

  before do
    @client = KewegoParty::Client.new(:token => 'd4c804fd0f42533351aca404313d26eb')

    @upload_key = "9c4f35567be7fda1e143d95696fadb1a" # Digest::MD5.hexdigest(SecureRandom.hex(15))
  end

  describe ".upload_get_available_categories" do
    use_vcr_cassette "upload_get_available_categories"

    it "should return the upload categories" do
      @client.app_get_token # Get and save the app_token
      categories = @client.upload_get_available_categories

      categories.should have_at_least(2).items
    end
  end

  describe ".upload_get_upload_progress" do
    it "should return the progress of an upload" do
      VCR.turned_off do
        stub_request(:get, "http://api.kewego.com/app/getToken/?appKey=#{@client.token}").
            to_return(:body => fixture("app_get_token.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

        stub_request(:get, "http://api.kewego.com/upload/getUploadProgress/?appToken=#{@client.app_token}&upload_key=#{@upload_key}").
           to_return(:body => fixture("upload_get_upload_progress.xml"), :headers => {:content_type => "text/html; charset=utf-8"})

        @client.app_get_token # Get and save the app_token
        stats = @client.upload_get_upload_progress(@upload_key)

        stats.state.should == 'uploading'
      end
    end
  end
end