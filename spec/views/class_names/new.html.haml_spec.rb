require 'spec_helper'

describe "class_names/new" do
  before(:each) do
    assign(:class_name, stub_model(ClassName,
      :name => "MyString"
    ).as_new_record)
  end

  it "renders new class_name form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", class_names_path, "post" do
      assert_select "input#class_name_name[name=?]", "class_name[name]"
    end
  end
end
