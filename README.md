
## Jim's Goats - ReadMe


**R7 - Identification of the problem you are trying to solve by building this particular marketplace app**

In Melbourne there is an ever growing demand for sustainable, ethical, and environmentally friendly solutions to every day problems. From only Melbourne could Jim's Goats be born! Jim's Goats brings the sensibilities of beautiful country Victoria to the city by way of Goat. Goats can provide garden maintenance, exercise, companionship, dairy products, and breeding services all in one adorable animal, which is why we have launched Jim's Goats- the first ever two sided marketplace for goat rental.   

**R8 - Why is it a problem that needs solving?**

For those who live in an inner suburb, there is often a clash of concerns - can you still enjoy a patch of land and the benefits that come from having land without the expensive equipment and equipment storage? Further, can you routinely maintain that land without devoting your weekend to it or causing extreme noise and air pollution? Of course you can! With a goat! Goats will happily (& silently!) chew away dangerous and unsightly weeds and brush while you go about your business. In the age of the 'gig economy' let’s make lawn mower ownership a thing of the past, and utilise nature's lawn mowers- GOATS! Farmers will benefit by increasing their income while also outsourcing their goat’s dinner. City folk will benefit by knowing they are taking care of their home maintenance in an ethical environmentally and cost-effective way. Goats will benefit by being able to tour the city whilst enjoying a degustation of varying plants. The greater community will benefit by enjoying a longer sleep in on Sunday instead of listening to your leaf blower. Finally, and perhaps most importantly, the environment will benefit by the reduction of harmful pollutants caused by petrol powered lawn mowers and weed whackers.

**R9 - A link (URL) to your deployed app (i.e. website)**

[Jim's Goats - Heroku](https://jimsgoats.herokuapp.com)

**R10 - A link to your GitHub repository (repo).**

[Github Repo](https://github.com/mollymadden/goats)

**R11 - Description of your marketplace app (website), including:**
* Purpose

	* The purpose of this app is to bring together farmers (or goat owners) and those who require garden maintenance.

* Functionality / features
	* The most interesting features of this app includes payment functionality via Stripe, and image uploading functionality using Amazon Web Services.

* Sitemap
![Sitemap](https://github.com/mollymadden/goats/blob/master/app/assets/images/jimsgoatssitemap.png?raw=true)

* Screenshots

![Homepage](https://github.com/mollymadden/goats/blob/master/app/assets/images/ss_home.png?raw=true)

![New Listing](https://github.com/mollymadden/goats/blob/master/app/assets/images/ss_new_listing.png?raw=true)

![Index](https://github.com/mollymadden/goats/blob/master/app/assets/images/ss_index.png?raw=true)

![Order History](https://github.com/mollymadden/goats/blob/master/app/assets/images/ss_order_history.png?raw=true)


* Target audience

	* The target audience for Jim's Goats are a market segment not reached by Jim's Mowing primarily due to cost. This marget segment is not concerned with pristine landscaping, and so cannot justify a weekly bill of $100+ in spring and summer for garden maintenance. They live in inner suburbs of Melbourne, are likely renters, and do not possess the storage space to own their own equipment. They are likely in their mid twenties and are frequent users of other two-sided marketplaces such as Airbnb or Uber. This customer is environmentally conscious, tries to buy locally, and has completed some/all of their higher education. They are not married and do not have kids. They do not have a large disposable income. They will use this app mainly on their phone, and so RESPONSIVE DESIGN will need to be first on the to do list post MVP.

* Tech stack (e.g. html, css, deployment platform, etc)

	* Jim's Goats was built with Ruby on Rails, using embedded Ruby, HTML, CSS, Bootstrap, and has been deployed on Heroku. A Puma web server is utilised through Rails 6.0.

**R12 - User stories for your app**

**Customer User Story**

* Homer the Hipster is a 24-year-old Thornbury local who shares a small 3 bedder on 400 sqm block with 2 housemates. They all attend uni and work part time in retail or hospo. Homer has a discretionary budget of less than $400 pcm which goes mainly to deconstructed lattes, smashed avo on toast, ironic tattoos, and op shop fashion. Like many houses in the trendy north, theirs does not have a garage. It is the first week of November; there has been heavy rain but also lots of sun in Melbourne recently. They have an unruly garden that has been growing rapidly. Housework is split three ways, and Homer is in charge of garden maintenance. The housemates cannot afford to invest in a lawnmower and none have the time to cut back the garden by hand. Homer does not own a car, so cannot borrow his parent’s lawnmower. He googles 'Jim's Mowing,' the best-known company for garden maintenance in Australia. After receiving a quote that is beyond their budget, he continues to look through Google for a solution. He comes across Jim's Goats.  
* Homer opens up jimsgoats.herokuapp.com for the first time and reads the banner on the homepage that describes how goats can be a sustainable and affordable option for garden maintenance. As an ethically minded Melburnian, he visits the About page to check up on if this company treats the goats fairly. After being satisfied that all goats are well cared for, he returns to the home page. 
* He sees two options, "I need a goat," or "I have a goat"
* He chooses "I need a goat." Homer is then presented with listing upon listing of local goats owned by regional farmers. Each of these goats have a picture, a name, a price per day, and a special skill. He only needs a goat for gardening, but wouldn't mind having someone to do yoga with if there's time, so he filters by 'Yoga Master.' He finds a cute Pygmy goat named Gotye who costs $16 per day. 
* When Homer clicks on Gotye's profile to learn more, he is redirected to a login or sign up page. As he is a new user, he chooses sign up.
* On the sign-up page, he's asked to fill in his email and choose a password.
* Homer finishes the sign-up process, and is then redirected back to Gotye; Gotye's profile indicates 'drop off available' and that Gotye's star sign is Virgo, which is perfect because Homer is a Scorpio.
* He clicks on 'Book Goat'
* Homer is asked to input his address. He begins typing, and address suggestions begin populating from Google. Homer thinks 'how convenient!' and picks the correct address. He is presented with a summary of his chosen goat, and is prompted once more to review his details and confirm he is ready to proceed. 
* Homer does one final review of his details and Gotye's price, and clicks 'Pay Deposit of $16.' If he wants to abandon the process at this stage, he can simply click 'Home' or 'See All Goats' or close the browser window. If the details on this page are incorrect, he can click 'Go Back'
* On the payment page, Homer inputs his credit card details, and is redirected back to a page where he can print his receipt, and click a link to view his order history. This step completes Homer's user journey through the Jim's Goats app. From here, the owner of the goat will reach out to Homer to arrange drop off of Gotye.


WISHLIST

* There will be additional filters by availability and drop off.
* He can add a goat to his 'favourites.'



**Vendor User Story**

* Marge the 42 year old married farmer owns an animal sanctuary and pumpkin farm in Gippsland with 20 goats on her property. She has been deeply affected by the droughts and fires across Victoria and is struggling to provide enough greenery for her goats to consume. She has read an article on News.com.au about how goats are being hired by Metro to clean up hazardous brush around Belgrave station in Melbourne, and decides to google 'Goat Hire.'
* The first link she clicks on is jimsgoats.herokuapp.com
* She heads to the About page to read what this is all about, and learns that Jim's Goats is a two-sided marketplace bringing together Goat owners and customers. She is concerned that someone might hurt one of her goats through the platform, but is comforted by the strict terms and conditions imposed by the website. She learns that Jim’s Goats has a strong security policy and collects data about all goat renters to ensure that they are prosecuted if necessary. She heads back to the home page via the nav bar.
* She sees two options, "I need a goat," or "I have a goat"
* She chooses "I have a goat."
* From there, she is redirected to a sign-up or login screen
* She chooses sign-up
* Marge is prompted to enter her email and password.
* Once she finishes signing up, Marge is redirected to create a new listing. She will input details about one of her most lively goats, Zygote. She decides that Zygote should be paid about $40 a day for his services, and describes him at length including his coat colouring, likes, dislikes, and Myers-Briggs personality type. She notes his breed, and marks him as a 'Cuddly Companion' because he is sweet and very well behaved. She marks that drop off is available (she owns a 2006 Toyota Land Cruiser ute) and finally lists his favourite treats as Chicken Twisties and Turkish Delight (SPECIAL OCCASIONS ONLY!) She uploads her best picture of him, and clicks 'Create Listing.'
* Her listing of Zygote appears on the screen, and she is able to review what she wrote and edit if necessary. She can also delete the listing if she feels Zygote needs a sabbatical. There is a banner at the top of the page to ensure she does not attempt to book this goat for herself (she does have twenty afterall!)
* Marge clicks the link next to Zygote's photo 'Back to all goats,' and can see a list of all goats available on Jim’s Goats. Zygote is at the top of the list because he is the most recently added. There is also a yellow star on his card to remind her that he belongs to her. This step completes Marge's user journey through the Jim's Goats app. From here, she will wait for someone to book Zygote, which will be facilitated by the administrators of Jim's Goats.


WISHLIST

* An 'Account' drop down menu that shows a list to the vendor of all the goat bookings they have ever serviced.
* An email function to connect vendors and customers within the app.


**R13 - Wireframes for your app**
![Trello Board](https://github.com/mollymadden/goats/blob/master/app/assets/images/wireframe.png?raw=true)

**R14 - An ERD for your app**
![ERD](https://github.com/mollymadden/goats/blob/master/app/assets/images/GOATS_erd.jpeg?raw=true)

**R15 - Explain the different high-level components (abstractions) in your app**

* In terms of development, many SQL queries have been abstracted into Ruby code, such as in views/listings/index where data can be filtered. This filter function uses the ruby method 'pluck,' which in this instance is an abstraction of SQL's 'where.' This particular abstraction is for the developer's (my) convenience.

* High-level abstractions for the benefit of the user allows them create, read, update, and delete data on various tables. Like in all good apps, the user does not see the functionality behind the scenes, because the code has been abstracted between SQL, Ruby, and other languages to a final graphical user interface. Using the same example as above, the index filter is abstracted to HTML by way of embedded ruby which is easily readable and understood by any user. 

* I further used Active Record and Active Storage to abstract databases and files respectively. Form helpers also assisted in abstraction from Action View to HTML.

**R16 - Detail any third party services that your app will use**

  The app uses the following third party services:
  * Devise - a ruby gem providing authentication solution for Rails. This gem creates a full MVC for user profile based functionality.
  * Stripe - an API allowing real world payment functionality. Implemented as a gem with javascript.
  * Bootstrap - a CSS framework for basic styling. Implemented as a gem with SCSS.
  * Amazon Web Services - an API providing a data storage solution located in Amazon's cloud network.
  * Heroku - The platform on which the app is deployed. Heroku manages the database and server functionality with minimal fuss, and is free for small scale rails projects.
  * Postgres - an open source database that marries up nicely to Heroku.
  * Google Places API - Used in this app to provide autocomplete suggestions based on the typing of an address. 

**R17 - Describe your projects models in terms of the relationships (active record associations) they have with each other**

* I decided to base my models around a central model - being the listings table. The listings table links to the users table, skills table, and deposits table through foreign keys. The user table acts as an intermediary between listings and deposits as seen above in the attached ERD (R14.) Several migrations were run to acheive the final result.

**R18 - Discuss the database relations to be implemented in your application**

* The database relations implemented are as follows:

* One to many
	* One user has many listings
	* One skill has many listings
* Many to many
	*  Many listings can have many deposits through users

I chose to model my first rails project this way to simplify possible pitfalls with a complex structure while still allowing for at least one many to many relationship to give a bit of depth to the model. A user should be able to have many listings and therefore many deposits through these listings.

**R19 - Provide your database schema design**

* The database relations implemented are as follows: A user has many listings and many deposits through listings. A listing belongs to a user and has one deposit through a user. A listing also belongs to skill, which has many listings. A deposit belongs to user and also belongs to listing. I chose to make genders and drop_off on the listings table because as binary options that allowed me to use an enum in the model. I chose to use text for notes and description to allow for larger chunks of text in these fields. Bigints were used for all ID's to allow for easy scaling. Please see below screenshot of schema for further information. 

![Schema1](https://raw.githubusercontent.com/mollymadden/goats/master/app/assets/images/schema-1.png)
![Schema2](https://raw.githubusercontent.com/mollymadden/goats/master/app/assets/images/schema-2.png)


**R20 - Describe the way tasks are allocated and tracked in your project**
![Trello Board](https://github.com/mollymadden/goats/blob/master/app/assets/images/trello.png?raw=true)













