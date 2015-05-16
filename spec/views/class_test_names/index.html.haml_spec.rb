require 'spec_helper'

describe "class_test_names/index" do
  before(:each) do
    assign(:class_test_names, [
      stub_model(ClassTestName,
        :name => "Name"
      ),
      stub_model(ClassTestName,
        :name => "Name"
      )
    ])
  end

  it "renders a list of class_test_names" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
