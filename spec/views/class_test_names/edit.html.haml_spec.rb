require 'spec_helper'

describe "class_test_names/edit" do
  before(:each) do
    @class_test_name = assign(:class_test_name, stub_model(ClassTestName,
      :name => "MyString"
    ))
  end

  it "renders the edit class_test_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", class_test_name_path(@class_test_name), "post" do
      assert_select "input#class_test_name_name[name=?]", "class_test_name[name]"
    end
  end
end
