Feature: Obtener token de acceso

  Background:
    Given url apiUrl + 'users/login'
    * def jsonUser =
    """
    {
      "user": {
        "email": "costa@gmail.com",
        "password": "Costa123"
      }
    }
    """

  Scenario: Obtenemos el token
    When request jsonUser
    And method POST
    Then status 200
    * def token = 'Token ' + response.user.token
    * print 'Token de acceso:', token
