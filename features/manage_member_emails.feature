Feature: Manage member_emails
  In order to [goal]
  [stakeholder]
  wants [behaviour]
  
  Scenario: Register new member_email
    Given I am on the new member_email page
    When I fill in "Email" with "email 1"
    And I press "Save"
    Then I should see "email 1"

  Scenario: Delete member_email
    Given the following member_emails:
      |email|
      |email 1|
      |email 2|
      |email 3|
      |email 4|
    When I delete the 3rd member_email
    Then I should see the following member_emails:
      |Email|
      |email 1|
      |email 2|
      |email 4|
