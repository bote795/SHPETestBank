require 'spec_helper'

describe "class_names/edit" do
  before(:each) do
    @class_name = assign(:class_name, stub_model(ClassName,
      :name => "MyString"
    ))
  end

  it "renders the edit class_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", class_name_path(@class_name), "post" do
      assert_select "input#class_name_name[name=?]", "class_name[name]"
    end
  end
end
