Feature: Configure date and time for site purprose
  In order to simply publication of dates for site editors
    As a site administrator
    I want to configure sensible defaults

  Background: 
    Given I am on "/user"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "changeme"
    And I press "Log in"

  Scenario: Set the time zone for a single locale
    Given I follow "Configuration"
    And I follow "Regional settings"
    And I uncheck "Users may set their own time zone"
    When I press "Save configuration" 
    Then I should see "The configuration options have been saved."

  Scenario: Add a short, quickly scannable date  
    Given I follow "Configuration" 
    And I follow "Date and time"
    And I follow "Formats"
    And I follow "Add format"
    And I fill in "Format string" with "d M y"
    When I press "Add format"
    Then I should not see "This format already exists."
    And I should see "Custom date format added."

  Scenario: Give this short format a name
    Given I am on "/admin/config/regional/date-time"
    And I follow "Add date type"
    And I fill in "Date type" with "Block-short"    
    #necessagry to run without javascript
    And I fill in "block_short" for "Machine-readable name"
    And I select "d M y" from "Date format"
    When I press "Add date type"
    Then I should see "New date type added successfully."  
    #todo And I should see the right date format for today"

  # Scenario: Set the date and time formats appropriate to the region
      
    
    
    
