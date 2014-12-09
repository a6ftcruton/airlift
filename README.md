Airlift - Emergency Supply Delivery 
===========
![alt text][logo]
[logo]: https://github.com/a6ftcruton/airlift/blob/master/app/assets/images/AirLift-logo.png "Airlift Logo"
===========
Priorities change in an emergency situation. After a hurricane, earthquake, or flood, the things you need become both more important and harder to get.  Airlift allows users to place an order, choose a dropoff location, and wait for the Airlift pallet to drop from the sky.

 Built for [Turing School of Software and Design](https://turing.io), this application pivots a legacy codebase--originally a restaurant site with single administrator functionality--into a multitenant application offering vendor sign up and store curation. The app also provides customers the ability to shop by items, category, or vendor, then proceed through a simple site checkout. We handle dividing an order between vendors behind the scenes.

The real difference from this app and other multitenant online experiences is the means by which customers receive their order. Pickup from an approved vendor is always available, but the typical customer requires remote delivery. For this option, the app uses customer geolocation through the browser and then allows the customer to change their location by simply moving the marker on a google map and clicking 'Drop My Order Here.' 

####Users can:
* create an account
* login/logout 
* browse all items
* browse/filter items by category
* browse items by vendor
* choose a pickup location from Google Maps 
* choose a pickup date from calendar
* geolocate based on IP
* use Google Maps marker to specify delivery location

####Vendors can:
* apply for an Airlift-hosted online store  
* edit site content
* upload product images
* manage site administrators

______

###Visit the site in production:
Live Site http://airlifter.herokuapp.com/

###or run the code locally:
Clone the repo:
`git clone https://github.com/a6ftcruton/airlif://github.com/a6ftcruton/airlift`

Bundle: 
`bundle` or `bundle install`

Prepare your database:
`rake db:setup`


