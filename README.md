# README

This is a website for flights booking. 
In the root path you can search and select flights.
The website will show only the future flights available, the past ones are still in the database but the user can't access them.
If you leave the date field empty, the website will show you all the flights available for your chosen destination.
After selecting your flight you should input how many seats you want to book (between 1 and 4). The seats parameter will be used by the website to determine how many user forms to generate. The passengers records are built from the Booking model, using nested parameters. After you fill all the information you will be redirected to a page that will show you all the information that you filled and that tells you that you booked your flight successfully.
