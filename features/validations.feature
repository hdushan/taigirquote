Feature: Field validations for Age and Email

  Scenario Outline: Invalid Emails
    Given I am on the TAIGIR Life Insurance page
    When I enter an invalid email '<invalid_email_address>'
    Then I should see an error message that the 'email is not valid'

  Examples:
    | invalid_email_address |
    | taigir@gmail          |
    | @gmail.com            |
    | taigir.com            |
    | @                     |
    | taigir                |
    | taigir@gmail.         |

  Scenario Outline: Valid Emails
    Given I am on the TAIGIR Life Insurance page
    When I enter an invalid email '<valid_email_address>'
    Then I should not see an error message that the 'email is not valid'

  Examples:
    | valid_email_address       |
    | taigir@gmail.com          |
    | taigir@iag.com.gov.au     |
    | TAIGIR@GMAIL.COM          |
    | taigir_rules@o'course.com |

  Scenario Outline: Invalid Age
    Given I am on the TAIGIR Life Insurance page
    When I submit my '<invalid_age>' with incorrect values
    Then I should see an error message that the 'The age is required. Numeric, bigger than zero.'

  Examples:
    | invalid_age |
    | xy          |
    | !!          |
    | @bc         |
    | ---         |