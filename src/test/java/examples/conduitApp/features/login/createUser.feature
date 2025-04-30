@smokeTest
@wip
Feature: User Registration

  Background: Set base URL and initialize data generator
    Given url apiUrl + 'users'
    * def DataGenerator = Java.type('examples.conduitApp.helpers.DataGenerator')

  Scenario: Successfully register a new user
    * def username = DataGenerator.getRandomUsername()
    * def email = DataGenerator.getRandomEmail()
    * def jsonUser =
    """
    {
      "user": {
        "username": "#(username)",
        "email": "#(email)",
        "password": "123123"
      }
    }
    """
    And request jsonUser
    When method POST
    Then status 201
    And response.user.username == username
    * print response.user


