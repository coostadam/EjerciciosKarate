@ignore
Feature: Registro como usuario en la aplicación

  Background:
    Given url apiUrl + 'users'

  Scenario: Estoy en la página de registro
    # Por cada inicio de sesión, se debe crear un nuevo usuario, con nuevo usuario y correo.
    * def jsonUser =
    """
    {
      "user": {
        "username": "costa12200",
        "email": "costa12200@karate.com",
        "password": "123123"
      }
    }
    """
    And request jsonUser
    When method POST
    Then status 201
    And response.user.username == 'costa12200'
    * def token = response.user.token
    * print 'Token: ' + token
    * print response.user


