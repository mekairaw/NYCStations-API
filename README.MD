# NYCStations-API

Simple Web API project for fetching NYC Stations, Calculating distance between two stations, with login and user creation.

# Listing of Endpoints

/api/users/create - Create a new user with the following fields on the body: Name, LastName, UserName, Email, Password and ConfirmPassword, this will return the token that will be used for every single endpoint on this API with the exception for this creation endpoint, the login endpoint or the stations endpoint. On this endpoint it will return the id of the newly created user, so it can be used on the favorite stations endpoint.

/api/stations - Listing of all stations

/api/stations/{id} - Fetching of a specific station

/api/login - Login for existing users

/api/stations/distance?firstId={id}&secondId={id} - Calculate distance between two stations, the IDs need to be specified on the query strings as shown in the example

/api/users/{id}/favoriteStations - Fetch most frequent used stations by user, this is determined by how many times the user uses the distance calculation endpoint, so it will basically define the most visited stations based on the origin destination and end destination of the distance endpoint, up to 5 different stations.

# Installation

I will attach an SQL Creation and population script on the project, please run that locally on your SQL Server Management, once that is done, you should be able to verify if the application is running as expected, the default endpoint should be /api/stations. Afterwards you can use the list of endpoints as a reference on how to use every endpoint.
