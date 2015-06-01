Use Yelp Me Find a Groupon to easily find out how good business are that offer deals on Groupon and whether or not the deals are worth getting.

Once approved, you will receive a link to get an api access key.  Save this key somewhere safe.  This key will be entered as a header to gain access to the api.

/api/v1/merge takes parameters.  The first is the location that will be searched in Yelp, and after that any number of parameters can be entered to search in Groupon.  These can be location= , limit= , radius= , category= .  
Possible categories are food-and-drink, things-to-do,beauty-and-spas,	health-and-fitness,	home-improvement,	local-services, shopping, automotive.  All Groupon results will be returned, and those businesses that have Yelp ratings will have that rating added.

/api/v1/show takes parameters just like merge, except the results will be only Groupons that have Yelp ratings.  Businesses without Yelp ratings will be excluded from the results.
