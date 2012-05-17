Feature: Next Problem
  In order to be able continue resolving problem
  a user
  wants to advance to the next problem

  Scenario: A user can't click on next problem if the current is not approved
    Given I am logged in as a user named "rubeque"
    And the problem "The Truth" is followed by "Reverse"
    When I go to the problems page
    And I follow "The Truth"
    Then I should not see "Next problem"

  Scenario: A user can click on next problem if the current is approved
    Given I am logged in as a user named "rubeque"
    And the problem "The Truth" is followed by "Reverse"
    And the user "rubeque" correctly solved problem "The Truth"
    When I go to the problems page
    And I follow "The Truth"
    And I follow "Next Problem"
    Then I should be on the problem page for "Reverse"

  Scenario: A user can't click on next problem if the current has no next problem
    Given I am logged in as a user named "rubeque"
    And the user "rubeque" correctly solved problem "The Truth"
    When I go to the problems page
    And I follow "The Truth"
    Then I should not see "Next problem"
