Feature: Enable modules
  In order to extend the functionality of Drupal core
    As a site administrator
    I need to be able to enable modules 

  Background: 
    Given I am on "/user"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "changeme"
    And I press "Log in"

  Scenario: Enable the modules
    Given I disable Overlay
    And I am on "/"
    And I follow "Modules"
    And I check "Colors"
    And I check "Views"
    And I check "Token"
    And I press "Save configuration"
    And I press "Continue"
    And I check "Pathauto"
    And I check "Chaos tools"
    And I check "Views UI"
    And I check "Date"
    And I check "Date API" 
    And I check "Date Views"
    And I check "Date Popup"
    And I check "FullCalendar" 
    And I check "FullCalendar Colors"
    And I check "Colorbox"
    When I press "Save configuration"
    Then I should see "The configuration options have been saved."
    Then show last response
