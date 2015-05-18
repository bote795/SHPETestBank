require 'spec_helper'

describe "member_emails/index" do
  before(:each) do
    assign(:member_emails, [
      stub_model(MemberEmail,
        :email => "Email"
      ),
      stub_model(MemberEmail,
        :email => "Email"
      )
    ])
  end

  it "renders a list of member_emails" do
    render
    # Run the generator again with the --webrat flag if you want to use webrat matchers
    assert_select "tr>td", :text => "Email".to_s, :count => 2
  end
end
