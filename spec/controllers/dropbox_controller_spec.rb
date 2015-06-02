require 'spec_helper'

describe DropboxController do

  describe "GET 'authorize'" do
    it "returns http success" do
      get 'authorize'
      response.should be_success
    end
  end

  describe "GET 'get_tests'" do
    it "returns http success" do
      get 'get_tests'
      response.should be_success
    end
  end

  describe "GET 'update_database'" do
    it "returns http success" do
      get 'update_database'
      response.should be_success
    end
  end

end
