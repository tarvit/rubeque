Feature: Next Problem
  In order to be able continue resolving problem
  a user
  wants to advance to the next problem

  #User Actions
  Scenario: A user can't click on next problem if the current is not approved
    Given I am logged in as a user named "rubeque"
    And the problem "The Truth" is followed by "Reverse"
    When I go to the problems page
    And I follow "The Truth"
    Then I should not see "Next problem"

  Scenario: A user can't click on next problem if the current has no next problem
    Given I am logged in as a user named "rubeque"
    And the user "rubeque" correctly solved problem "The Truth"
    When I go to the problems page
    And I follow "The Truth"
    Then I should not see "Next problem"

  Scenario: A user can click on next problem after successfully submitting the current one
    Given I am logged in as a user named "rubeque"
    And the problem "The Truth" is followed by "Reverse"
    When I go to the problems page
    And I follow "The Truth"
    And I fill in "solution_code" with "true"
    And I submit the solution
    And I follow "Next problem"
    Then I should be on the problem page for "Reverse"

  Scenario: A user can click on next problem after successfully updating a solution
    Given I am logged in as a user named "rubeque"
    And the problem "The Truth" is followed by "Reverse"
    And the user "rubeque" correctly solved problem "The Truth"    
    When I go to the problems page
    And I follow "The Truth"
    And I fill in "solution_code" with "true"
    And I submit the solution
    And I follow "Next problem"
    Then I should be on the problem page for "Reverse"


  #Guest Actions
  Scenario: A guest can't click on next problem if the current is not approved
    Given the problem "The Truth" is followed by "Reverse"
    When I go to the problems page
    And I follow "The Truth"
    Then I should not see "Next problem"

  Scenario: A guest can click on next problem after successfully submitting the current one
    Given the problem "The Truth" is followed by "Reverse"
    And I go to the problems page
    When I follow "The Truth"
    And I fill in "solution_code" with "true"
    And I submit the solution
    And I follow "Next problem"
    Then I should be on the problem page for "Reverse"
