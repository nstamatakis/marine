<p align="center"><img src="https://res.cloudinary.com/dtfbvvkyp/image/upload/v1566331377/laravel-logolockup-cmyk-red.svg" width="400"></p>


## Prerequisites for installation

- PHP 7.4
- Postgres 11
- Apache or nginx with php-fpm

## Setup the project

#### Windows

- In hosts file make a new row with this line  <b>127.0.0.5 marines.test</b>
- In httpd-vhosts add this tag <b>
                              <VirtualHost 127.0.0.5:80>
                               DocumentRoot "path\to\app\marine\apiApp\public"
                               DirectoryIndex index.php
                               ServerName  marines.test
                               <Directory  "path\to\app\marine\apiApp\public">
                               Options Indexes FollowSymLinks MultiViews
                               AllowOverride all
                               Order Deny,Allow
                               Allow from all
                               Require all granted
                               </Directory>
                               </VirtualHost> </b>
- Restart apache.                               
- I wanted to use docker but my version in the container is PHP 7.3 and i have to build another container.

## Env init
- Firstly create an .env file in the apiApp folder with the example given into the .env.example.sts
- Create the corresponding database from your .env file.

## Database

- In the app/database/sts.sql is the database to initialize the project's database. If you want to make migration step by step
skip this section.

## Steps to migrate

- Run in the apiApp directory the command <b> composer install </b>.
- Then run in the apiApp directory the command <b> php artisan migrate </b>.
- Run the command php artisan passport:install
- In your database run all queries one by one contained in the database/x.x.x.sql file.
- The csv file required is located in storage/app/public/assignment_dataset.csv

## Init the project

- First uncomment the line 177 in apiApp/config/app.php to enable the VesselServiceProvider.
- When we initialize the database from x.x.x.sql we have already implemented a test user with email : nick@mail.gr
and password : 11111111.

## Header Keys

- When running the apiApp from postman or another platform we need to set a few keys to make app working.
- The AppApiKey key and the value is located in your .env file in the corresponding key.
- The Accept key and the values are [application/json || application/xml].
- Those keys are mandatory for the initialization.
- Authorization key is needed to navigate through /vessel and /invitation/ask requests.
To make it work you need the Authorization key and the value will be Bearer and the accessToken.
Eg : Authorization <b>Bearer accessToken</b>. 

## Audits

- Every action through tracker is recorded in audits table.

## Routes

- POST : /api/user/login , request : [email , password] , response : userObject and accessToken.
- POST : /api/user/register , request : [email,password,name,invitation*], response : success or error message
- GET : /api/invitation/ask(Authorization key needed) , response : invitationToken.
- GET : /api/tracker(Authorization key needed) , request : params corresponding to api requirements, response : xml || json depends on Accept Key.
3Q2lKxMRtpUz7Ynt1ZZv
## How to register a user

- To register a user the invitation pattern is used.
- Firstly an authenticated user (nick@mail.gr) has to ask for an invitation and then send it to the user he wants to invite.
- The candidate user then must fill his email,name,password,invitation.
- Eg flow : A) nick@mail.gr asks an invitation 
            B) App will give him back the invitation.
            C) nick@mail.gr gives the token to the candidateUser
            D) candidateUser uses the invitation with his personal info to register.
            E) candidateUser now is userB.
            F) userB posts to login with his email and password.
 
 ## Login user
 
 - When user is logged in the object of the user model will be returned as response with an accessToken.
 - The accessToken will accompany his requests in the /tracker requests.
 
 ## Tracker
 
 - The tracker resource accepts the following query filters : lat,lon,max_lat,max_lon,min_lat,min_lon,length,width,mmsi and page
 - mmsi filter can be an array and it has to be placed like this : mmsi[]=x,y,...,n || mmsi=x
 - pagination is available with the page filter in the params.
 
 ## Inside The Project
 
 #### Tracker Module
 
 - Tracker Module has  all the logic for the tracker resource.
 - It also includes the Api/LoginController. It could live outside from there but the only service to run is the vessel for now.
 
 
 #### Pagination and Cache Time
 - Pagination for the results are 50 by default. But you can bypass the value from pagination key into the apiApp/config/tracker/vessels/composers.php.
 - User can use the api for 10 requests per hour. You can bypass the value from the cache_time key into the apiApp/config/tracker/services/request_per_hour.php.
 
 ##### Composers
 
 - There are two composers created to render results. The VesselComposer is a little bit different from the VesselComposer_v2.
 - The first one will give as a result the position from vessel and the coordinates will be rendered as text under the key position, but it skips one loop which can be very expensive if results are more.
 - The VesselComposer_v2 also has a cache process. If you request same query for 60 minutes the cache will output the result.
 - The second one will make the loop and create a position key and under there will place the coordinates lat and lon.
 - You can choose which composer will run from the turn_on key into the apiApp/config/tracker/vessels/composers.php
 - As mentioned before in the Accept key you can insert application\json or application\xml and the result will be rendered in the corresponding key.

##### PhotoIncluded

- There is a photo include in the app/storage/app/public from postman.
