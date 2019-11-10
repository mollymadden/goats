
## Jim's Goats - ReadMe

1. **CMP1042-1.2** Explain the different high-level components (abstractions) in your App.
 	* In terms of development, many SQL queries have been abstracted into Ruby code, such as in views/listings/index where data can be filtered. This filter function uses the ruby method 'pluck,' which in this instance is an abstraction of SQL's 'where.' This particular abstraction is for the developer's (my) convenience.
 	
	* High-level abstractions for the benefit of the user allows them create, read, update, and delete data on various tables. Like in all good apps, the user does not see the functionality behind the scenes, because the code has been abstracted between SQL, Ruby, and other languages to a final graphical user interface. Using the same example as above, the index filter is abstracted to HTML by way of embedded ruby which is easily readable and understood by any user. 



2. **CMP1042-1.3** Detail any third party services that your App will use
	* The app uses the following third party services:
		* Devise - a ruby gem providing authentication solution for Rails. This gem creates a full MVC for user profile based functionality.
		* Stripe - an API allowing real world payment functionality. Implemented as a gem with javascript.
		* Bootstrap - a CSS framework for basic styling. Implemented as a gem with SCSS.
		* Amazon Web Services - an API providing a data storage solution located in Amazon's cloud network.
		* Heroku - The platform on which the app is deployed. Heroku manages the database and server functionality with minimal fuss, and is free for small scale rails projects.
		* Postgres - an open source database that marries up nicely to Heroku.
		* Google Places API - Used in this app to provide autocomplete suggestions based on the typing of an address. 		 

3. **CMP1042-3.1** Identify the problem you’re trying to solve by building this particular marketplace App? Why is it a problem that needs solving?
	* In Melbourne there is an ever growing demand for sustainable, ethical, and environmentally friendly solutions to every day problems. From only Melbourne could Jim's Goats be born! Jim's Goats brings the sensibilities of beautiful country Victoria to the city by way of Goat.   

4. **CMP1042-3.3**
Describe your project’s models in terms of the relationships (active record associations) they have with each other

5. **CMP1042-4.2**
Discuss the database relations to be implemented with reference to the ERD

6. **CMP1042-4.3**
Provide your database schema design
![ERD](https://github.com/mollymadden/goats/blob/master/app/assets/images/GOATS_erd.jpeg?raw=true)

7. **CMP1042-6.1**
Provide User stories for your App

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

* Marge the 42 year old married farmer owns an animal sanctuary and pumpkin farm in Gippsland with 40 goats on her property. She has been deeply affected by the droughts and fires across Victoria and is struggling to provide enough greenery for her goats to consume. She has read an article on News.com.au about how goats are being hired by Metro to clean up hazardous brush around Belgrave station in Melbourne, and decides to google 'Goat Hire.'
* The first link she clicks on is jimsgoats.herokuapp.com
* She heads to the About page to read what this is all about, and learns that Jim's Goats is a two-sided marketplace bringing together Goat Owners and customers. She is concerned that someone might hurt one of her goats through the platform, but is comforted by the strict terms and conditions imposed by the website. She learns that Jim’s Goats has a strong security policy and collects data about all goat renters to ensure that they are prosecuted if necessary. She heads back to the home page via the nav bar.
* She sees two options, "I need a goat," or "I have a goat"
* She chooses "I have a goat."
* From there, she is redirected to a sign-up or login screen
* She chooses sign-up
* Marge is prompted to enter her email and password.
* Once she finishes signing up, Marge is redirected to create a new listing. She will input details about one of her most lively goats, Zygote. She decides that Zygote should be paid about $40 a day for his services, and describes him at length including his coat colouring, likes, dislikes, and Myers-Briggs personality type. She notes his breed, and marks him as a 'Cuddly Companion' because he is sweet and very well behaved. She marks that drop off is available (she owns a 2006 Toyota Land Cruiser ute) and finally lists his favourite treats as Chicken Twisties and Turkish Delight (SPECIAL OCCASIONS ONLY!) She uploads her best picture of him, and clicks 'Create Listing.'
* Her listing of Zygote appears on the screen, and she is able to review what she wrote and edit if necessary. She can also delete the listing if she feels Zygote needs some annual leave. There is a banner at the top of the page to ensure she does not attempt to book this goat for herself (she does have forty afterall!)
* Marge clicks the link next to Zygote's photo 'Back to all goats,' and can see a list of all goats available on Jim’s Goats. Zygote is at the top of the list because he is the most recently added. There is also a yellow star on his card to remind her that he belongs to her. This step completes Marge's user journey through the Jim's Goats app. From here, she will wait for someone to book Zygote, which will be facilitated by the administrators of Jim's Goats.


WISHLIST

* An 'Account' drop down menu that shows a list to the vendor of all the goat bookings they have ever serviced.
* An email function to connect vendors and customers within the app.




8. **CMP1042-6.2**
Provide Wireframes for your App for several different screen sizes (as required for the app)
![Trello Board](https://github.com/mollymadden/goats/blob/master/app/assets/images/wireframe.png?raw=true)


9. **CMP1042-6.3**
Describe the way tasks are planned and tracked in your project
![Trello Board](https://github.com/mollymadden/goats/blob/master/app/assets/images/trello.png?raw=true)


**Sitemap**

![Sitemap](https://github.com/mollymadden/goats/blob/master/app/assets/images/jimsgoatssitemap.png?raw=true)


