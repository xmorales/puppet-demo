# Session 4 - Exercises
## Exercise 1
Build an nginx module that:
* Is able to install nginx package in Centos and Ubuntu
* Ensures that the document root is present
* Ensures that the index.html is personalized with your hostname and ip address
* Declare your nginx class in a smoke test and run it
Use the following considerations:
* Document root has to be /var/www/html
* The service is not yet enabled, so we won't be able to browse in the web page.

## Exercise 2
Improve the nginx module so that:
* Enables the service and restarts every time configuration changes
* Is able to configure a virtualhost with the parameters 'servername', 'port'
* Ensures that it has a diferent document root per virtualhost
* Ensures that each document root has an index.html with the servername, the hostname and ip address
* Declare a smoke test that configures 2 virtualhosts

## Exercise 3
