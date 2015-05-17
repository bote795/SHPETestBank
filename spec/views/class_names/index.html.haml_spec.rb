require 'spec_helper'

describe "class_names/index" do
  before(:each) do
    assign(:class_names, [
      stub_model(ClassName,
        :name => "Name"
      ),
      stub_model(ClassName,
        :name => "Name"
      )
    ])
  end

  it "renders a list of class_names" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Name".to_s, :count => 2
  end
end
