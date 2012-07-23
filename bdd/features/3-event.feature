Feature: Create a way to enter events
  In order to support content editors
  As a site administrator
  I need to create a way to enter events with sensible defaults

  Background:
    Given I am on "/user"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "changeme" 
    And I press "Log in"                         

  Scenario: Add an event content type                                   
    Given I follow "Structure"                                           
    And I follow "Content types"                                        
    And I follow "Add content type"                                      
    And I fill in the following:                                        
    | Name                                 | Event                                            |
    | Machine-readable name                | event                                            |
    | Description                          | Create an event for display on the site calendar |
    | Title field label                    | Event                                            |
    | Explanation or submission guidelines | Create an event for display on the site calendar |
    And I select "Closed" from "Default comment setting for new content" 
    And I check "Published"                                              
    And I uncheck "Promoted to front page"                              
    And I uncheck "Display author and date information"                  
    When I press "Save content type"                                     
    Then I should see "The content type Event has been added."

  Scenario: But wait, there's no date!
    Given I am on "/admin/structure/types/manage/event/fields"
    And I fill in "edit-fields-add-new-field-label" with "Date" 
    And I fill in "edit-fields-add-new-field-field-name" with "date"
    And I select "Date" from "edit-fields-add-new-field-type"
    And I select "Pop-up calendar" from "edit-fields-add-new-field-widget-type"
    And I press "Save"
    Then I should see "Field Settings"
    When I press "Save field settings"
    And I check "Collect an end date" 
    And I check "Required" 
    Then I should see "Event settings"
    When I press "Save settings"
    Then I should see "Saved Date configuration"

  Scenario: The content should have a meaningful url
    Given I am on homepage
    When I follow "Configuration"
    And I follow "URL aliases"
    And I follow "Patterns"
    And I fill in "Pattern for all Event paths" with "calendar/[node:title]"
    And I press "Save configuration" 
    Then I should see "The configuration options have been saved."

  Scenario: Let's be sure it does what we expected
    Given I am on "/node/add/event"
    And I fill in "Event" with "A test event"
    When I press "Save"
    Then I should be on "/calendar/test-event"

