Given /^the following class_names:$/ do |class_names|
  ClassName.create!(class_names.hashes)
end

When /^I delete the (\d+)(?:st|nd|rd|th) class_name$/ do |pos|
  visit class_names_path
  within("table tr:nth-child(#{pos.to_i+1})") do
    click_link "Destroy"
  end
end

Then /^I should see the following class_names:$/ do |expected_class_names_table|
  expected_class_names_table.diff!(find('table').all('tr').map { |row| row.all('th, td').map { |cell| cell.text.strip } })
end
