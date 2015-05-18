require 'spec_helper'

describe "member_emails/new" do
  before(:each) do
    assign(:member_email, stub_model(MemberEmail,
      :email => "MyString"
    ).as_new_record)
  end

  it "renders new member_email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", member_emails_path, "post" do
      assert_select "input#member_email_email[name=?]", "member_email[email]"
    end
  end
end
