<?php

use Behat\Symfony2Extension\Context\KernelAwareInterface;
use Behat\MinkExtension\Context\MinkContext;
use Behat\Behat\Context\ClosuredContextInterface,
    Behat\Behat\Context\TranslatedContextInterface,
    Behat\Behat\Context\BehatContext,
    Behat\Behat\Exception\PendingException;
use Behat\Gherkin\Node\PyStringNode,
    Behat\Gherkin\Node\TableNode;
use Symfony\Component\Process\Process;

#require 'vendor/autoload.php';
require_once 'PHPUnit/Autoload.php';
require_once 'PHPUnit/Framework/Assert/Functions.php';

class FeatureContext extends MinkContext
{
    public function __construct(array $parameters) {
    }

    /** @BeforeFeature */
    public static function prepareForTheFeature() {
    // clean database or do other preparation stuff
    }


    /**
    * @Given /^I am on the homepage$/
    */
    public function iAmOnTheHomepage() {
      $this->getSession()->visit($this->locatePath('/'));
    }

    /**
    * @Then /^I should see the text "([^"]*)"$/
    */
    public function IShouldSeeTheText($text) {
      $element = $this->getSession()->getPage();
      $error = $element->find('css', '.error');
      if (!empty($error)) {
        throw new Exception($error->getText());
      } else {
        $this->assertSession()->pageTextContains($this->fixStepArgument($text));
    }

  }


  /**
   * @When /^I select the radio button "([^"]*)" with the id "([^"]*)"$/
   */

  public function iSelectTheRadioButtonWithTheId($label, $id) {
    $element = $this->getSession()->getPage();
    $radiobutton = $element->findById($id);
    if ($radiobutton === NULL) {
      throw new Exception('Neither label nor id was found');
    }
    $value = $radiobutton->getAttribute('value');
    $labelonpage = $radiobutton->getParent()->getText();
    if ($label != $labelonpage) {
      throw new Exception("Button with $id has label $labelonpage instead of $label.");
    }
    $radiobutton->selectOption($value, FALSE);
  }

  /**
   * @Given /^Database "([^"]*)" is empty$/
   */
  public function databaseIsEmpty($database_name)
  {
    $process = new Process("mysqladmin drop -f $database_name && mysqladmin create $database_name");
    $process->setTimeout(3600);
    $process->run();
    if (!$process->isSuccessful()) {
      throw new RuntimeException("Could not clear database $database_name - " . $process->getErrorOutput());
    }
  }

  /**
   * @Given /^Clean settings file$/
   */
  public function cleanSettingsFile()
  {
    $process = new Process("cp ../drupal/sites/default/default.settings.php ../drupal/sites/default/settings.php");
    $process->setTimeout(3600);
    $process->run();
    if (!$process->isSuccessful()) {
      throw new RuntimeException("Could not clean settings.php - " . $process->getErrorOutput());
    }
    $process = new Process("chmod 666 ../drupal/sites/default/settings.php");
    $process->setTimeout(3600);
    $process->run();
    if (!$process->isSuccessful()) {
      throw new RuntimeException("Could not make settings.php world writable - " . $process->getErrorOutput());
    }
  }

  /**
   * @Then /^wait "(\d+)" seconds$/
   */
  public function waitSeconds($seconds)
  {
      $this->getSession()->wait($seconds * 1000);
  }
    /**
     * @Given /^I disable Overlay$/
     */
    public function iDisableOverlay()
    {
    $process = new Process("drush @seven dis overlay -y");
    $process->setTimeout(3600);
    $process->run();
    if (!$process->isSuccessful()) {
      throw new RuntimeException("Couldn't disable overlay - " . $process->getErrorOutput());

    }
  }
}
