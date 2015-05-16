require 'spec_helper'

describe "class_test_names/show" do
  before(:each) do
    @class_test_name = assign(:class_test_name, stub_model(ClassTestName,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
