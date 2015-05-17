Feature: Manage class_test_names
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new class_test_name
    Given I am on the new class_test_name page
    When I fill in "Name" with "name 1"
    And I press "Save"
    Then I should see "name 1"

  Scenario: Delete class_test_name
    Given the following class_test_names:
      |name|
      |name 1|
      |name 2|
      |name 3|
      |name 4|
    When I delete the 3rd class_test_name
    Then I should see the following class_test_names:
      |Name|
      |name 1|
      |name 2|
      |name 4|
