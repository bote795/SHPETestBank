require 'spec_helper'

describe "member_emails/edit" do
  before(:each) do
    @member_email = assign(:member_email, stub_model(MemberEmail,
      :email => "MyString"
    ))
  end

  it "renders the edit member_email form" do
    render

    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "form[action=?][method=?]", member_email_path(@member_email), "post" do
      assert_select "input#member_email_email[name=?]", "member_email[email]"
    end
  end
end
