# Notas: Añadir el tag @smokeTest a nivel de feature para ejecutar todos los escenarios de la feature.
@smokeTest

Feature: Tratar artículos.

  Background:
    Given url apiUrl + 'articles'
    * def getTokenResponse = callonce read('classpath:examples/conduitApp/helpers/getAcessToken.feature')
    * def token = getTokenResponse.token
    * print 'Token: ' + token
    * def articleSlug = ''

  @wip
  Scenario: Obtener todos los artículos disponibles
    When method GET
    Then status 200
    * print response.articles


  Scenario: Publicar un artículo
    * def jsonArticle =
        """
    {
      "article": {
        "title": "Prueba 3",
        "description": "sssss.",
        "body": "Aquí puedes incluir el contenido principal del documento."
      }
    }
    """
    And header Authorization = token
    And request jsonArticle
    When method POST
    Then status 201
    * print response.article
        # And match response.article.title == 'Artículo principal de prueba 6'
    * karate.set('articleSlug', response.article.slug)

  Scenario: Obtener todos los artículos disponibles de mi usuario
    And header Authorization = token
    When method GET
    Then status 200
    * print response.articles

  Scenario: Editar artículo creado
    * def articleSlug = karate.get('articleSlug')
    Given url apiUrl + 'articles/' + articleSlug
    * def jsonArticle =
            """
    {
      "article": {
        "title": "Prueba 1 edit",
        "description": "Esto es un articulo de conduit editado.",
        "body": "Aquí puedes incluir el contenido principal del documento editado."
      }
    }
    """
    And header Authorization = token
    And request jsonArticle
    When method PUT
    Then status 200
    And response.article.title == 'Prueba 1 edit'
    And response.article.description == 'Esto es un articulo de conduit editado.'
    * print response.article
    * karate.set('articleSlug', response.article.slug)

  Scenario: Delete artículo
    * def articleSlug = karate.get('articleSlug')
    Given url apiUrl + 'articles/' + articleSlug
    And header Authorization = token
    When method DELETE
    Then status 204

  Scenario: Obtener todos los artículos disponibles de mi usuario
    And header Authorization = token
    When method GET
    Then status 200
    * print response.articles
