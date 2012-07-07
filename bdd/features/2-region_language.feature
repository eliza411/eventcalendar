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
    And I follow "Format"
    And I follow "Add format"
    And I fill in "Format string" with "d M y"
  When I press "Add format"
    Then I should not see "This format already exists."
    And I should see "Custom date format added."
    #toto And I should see the right date format for today"

# Scenario: Set the date and time formats appropriate to the region
    
  
  
  
