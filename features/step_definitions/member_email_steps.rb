Given /^the following member_emails:$/ do |member_emails|
  MemberEmail.create!(member_emails.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) member_email$/ do |pos|
  visit member_emails_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following member_emails:$/ do |expected_member_emails_table|
  expected_member_emails_table.diff!(find('table').all('tr').map { |row| row.all('th, td').map { |cell| cell.text.strip } })
end
