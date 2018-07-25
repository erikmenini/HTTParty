Feature: API Tests 
Using a valid API tests, i wanna do POST, GET, PUT and DELETE

@post 
Scenario: POST a new client
Given I wanna include a new client
When I post his datas
Then i should validate the response code 201

@get 
Scenario: GET an client
Given I do a GET in the endpoint client with id 2
Then i should see all the clients

@put 
Scenario: PUT the client
Given I edit the name the data of one client
When I do a put in the API for this the id 2
Then i should validate the data

@delete
Scenario: Delete the client
Given I delete the client with id 1
Then the response should be nil