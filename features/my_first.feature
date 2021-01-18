Feature: Login Functionality
    In order to ensure login functionality works,
    I want to run the cucumber test to verify it is working

    Background:
        Given the login page is opened successfully
    Scenario: Login Valid
        When I click on element "test_object"
        When user input username "tomsmith" and password "SuperSecretPassword!"
        Then the message "You logged into a secure area!×" should be displayed

    Scenario Outline: Login Invalid
        When user input username "<username>" and password "<password>"
        Then the message "<messsage>" should be displayed

        Examples:
            | username | password             | messsage                   |
            | anhpham  | SuperSecretPassword! | Your username is invalid!× |
            | tomsmith | wrong_password       | Your password is invalid!× |
