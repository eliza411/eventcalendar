@wip
Feature: Add a an upcoming event block 
  In order to make sure visitors don't miss out on events
  As a site administrator
  In want to use views to provide an Upcoming event block on the homep age

  Background:
    Given I am on "/user"
    And I fill in "Username" with "admin"
    And I fill in "Password" with "changeme"
    And I press "Log in"

  Scenario: Create a block 
    Given I am on "/"
    And I follow "Structure"
    And I follow "Views"
    And I follow "Add new view"
    And I fill in "View name" with "Upcoming events"
    And I fill in "Machine-readable name" with "upcoming_events"
    And I select "node" from "Show"
    And I select "Event" from "of type"
    And I select "Unsorted" from "sorted by"
    #fix-dirs
    And I uncheck "Create a page"
    And I check "Create a block"
    And I select "HTML list" from "Display format"
  #    And wait "1" seconds
    And I press "Save & exit"
    Then I should not see "The machine-readable name is already in use."
    And I should see "Your view was saved."

  @javascript
  Scenario: Add fields to the block
    Given I am on "/admin/structure/views/view/upcoming_events/edit"
    #fix-dirs
    And I follow "views-add-field"
    #fix-dirs
    And I check "Content: Date "
    And I press "edit-submit"
    And I uncheck "Create a label"    
    And I select "Date and time" from "Formatter"
    And I select "block_short" from "Choose how users view dates and times"
    And I select "Both Start and End dates" from "Display"
    And I press "Apply"
    And I follow "views-add-filter"
    And I select "All displays" from "For"
    And I check "Content: Date - end date (field_date:value2)"
    # This is different whan what the user sees.
    And I press "edit-submit"
    And I press "edit-submit"
    And I select "Is greater than or equal to" from "Operator"
    And I select "Enter a relative date" from "edit-options-value-value-group-value-choose-input-type"
    And I fill in "now" for "Relative date"
    And I press "edit-submit"
    And wait "1" seconds
    Then show last response
    And I press "views-add-sort"
    And I select "All displays" from "For"
    And I check "Date start date (field_date)"
    And I press "Apply (all displays)"
    And I check "Sort ascending"
    And I press "Apply (all displays)"
    And I press "Save"
  Then I should see "The view Upcoming events has been saved."
  
  @javascript 
  Scenario: Admin place block
    Given I am on "/"
    And I follow "Structure"
    And I follow "Blocks"
    And I should see "View: Upcoming events"
    And I follow "edit-blocks-views-upcoming-events-block-configure"
    And I fill in "Block title" with "Upcoming events"
    And I select "Sidebar second" from "Bartik (default theme)"
    And I check "Only the listed pages"
    And I fill in "edit-pages" with
    """
    <front>
    calendar/*
    """ 
    When I press "Save block"
    Then I should see "The block configuration has been saved"
     


