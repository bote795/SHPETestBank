class DropboxController < ApplicationController
  require 'dropbox_sdk'  
  
    
  def authorize
    
  end

  def get_tests
  end

  def update_database
    dropbox = DropboxClient.new(ENV["dropbox_sdk_token"])
    
    puts "LINKED account:", dropbox.account_info().inspect

    #file = open('working-draft.txt')
    #response = client.put_file('/magnum-opus.txt', file)
    #puts "uploaded:", response.inspect

    root_metadata = dropbox.metadata('/Archive/TEST BANK/Filed/')
    puts "METADATA:  ", root_metadata.inspect

    #contents, metadata = client.get_file_and_metadata('/magnum-opus.txt')
    #open('magnum-opus.txt', 'w') {|f| f.puts contents }
  end
end
