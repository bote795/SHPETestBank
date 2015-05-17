Feature: Manage class_names
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new class_name
    Given I am on the new class_name page
    When I fill in "Name" with "name 1"
    And I press "Save"
    Then I should see "name 1"

  Scenario: Delete class_name
    Given the following class_names:
      |name|
      |name 1|
      |name 2|
      |name 3|
      |name 4|
    When I delete the 3rd class_name
    Then I should see the following class_names:
      |Name|
      |name 1|
      |name 2|
      |name 4|
