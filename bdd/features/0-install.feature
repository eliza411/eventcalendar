Feature: Install Drupal
  In order to learn about Drupal
  As a site builder
  I need to install Drupal

@javascript
Scenario: Standard Install
  Given Database "mydb" is empty
    And Clean settings file
    And I am on "install.php"
  When I check "Standard"
    And I press "Save and continue"
    And I check "English (built-in)"
    And I press "Save and continue" 
    And I fill in the following:
    |Database name    |mydb|
    |Database username|mydb|
    |Database password|mydb|
    And I press "Save and continue"
  Then wait "10" seconds
    And I fill in the following:
    |Site name          |Events                         |
    |Site e-mail address|melissa+events@opensourcery.com|
    |Username           |admin                          |
    |E-mail address     |melissa+events@opensourcery.com|
    |Password           |changeme                       |
    |Confirm password   |changeme                       |
    And I uncheck "Receive e-mail notifications"
    And I press "Save and continue"
  Then I should see "Visit your new site"

