require 'spec_helper'

describe "class_names/show" do
  before(:each) do
    @class_name = assign(:class_name, stub_model(ClassName,
      :name => "Name"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Name/)
  end
end
