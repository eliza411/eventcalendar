Feature: Add a calendar
  In order to display events in a calendar
    As a site administrator
    In want to use views to provide a calendar

Background:
  Given I am on "/user"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "changeme"
    And I press "Log in"

@javacript
Scenario: Create a FullCalendar
  Given I am on homepage
    And I follow "Structure"
    And I follow "Views"
    And I follow "Add new view"
    And I fill in "View name" with "Calendar"
    And I fill in "Machine-readable name" with "calendar"
    And I select "Content" from "Show"
    And I select "Event" from "of type"
    And I select "Unsorted" from "sorted by" 
    And I fill in "Page title" with "Calendar"
    And I fill in "Path" with "Calendar"
    And I select "FullCalendar" from "Display format"
    And I uncheck "Use a pager" 
    And I check "Create a menu link"
    And I select "Main menu" from "Menu"
    And I fill in "Calendar" for "Link text"
    And I press "Continue & edit"
    And I follow "views-add-field" 
    And I check "Content (historical data): Date"
    And I press "Add and configure fields"
    And I uncheck "Create a label"
    And I press "Apply"
  When I press "Save"
  Then I should see "The view Calendar has been saved."

Scenario: Lets be sure it's where we think it is
  Given I am on homepage
  When I follow "Calendar"
  Then I should see "Month"
    And I should see "Week" 
 
    
