require 'spec_helper'

describe "member_emails/show" do
  before(:each) do
    @member_email = assign(:member_email, stub_model(MemberEmail,
      :email => "Email"
    ))
  end

  it "renders attributes in <p>" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    rendered.should match(/Email/)
  end
end
