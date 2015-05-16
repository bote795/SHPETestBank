require 'spec_helper'

describe "class_test_names/new" do
  before(:each) do
    assign(:class_test_name, stub_model(ClassTestName,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new class_test_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", class_test_names_path, "post" do
      assert_select "input#class_test_name_name[name=?]", "class_test_name[name]"
    end
  end
end
