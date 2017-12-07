Intro 

A year ago out of sheer boredom and curiosity I started reading Metaprogramming in Ruby by Pablo Perrotta. And there many interesting things and practices. One of them was called "Ghost Methods". 

What's a Ghost Method?

So what is a ghost method? Just like a really ghost, it is a thing that is not really there and still manages to do something(namely, scare the life out of you).

Let's look at an naive example(Cellar)

Say we got a regular cellar, that you grandparents may own. Usually we're gonna find there some potatoes, jars of pickles and wine, of course. So we may deposit some of these goods and we may take them out of the cellar. We can see from the implementation that it is kinda cumbersome to add new types of goods: add new attr_reader, a method for depositing, a method for taking out, modify initializer. Not cool.

So we move on to a Warehouse

It is a pretty big building, lots of space, much easier to add new goods to the menu. The only thing we need to do is just plug a good name into GOODS array. EZ. That is called dynamic method definition, you might have seen such examples in some of our projects.

Enter the Tesseract

The list of our buyers and suppliers grew. The need to store more goods emerged, so we watched us some RenTV and discovered that ancient Aztecs were taught by extraterrestrial overlords a technology to store anything without adding any extra code by simply using this alien legacy code.

Show some magic [Demo]

How it works

Ruby method lookup [right and up]. In ruby everything is an object, even a class. So in order to understand we have to know ruby object hierarchy. 

Ghost Methods are implemented using `method_missing`, thus we say to our class that should it encounter a method that is not defined on it, it should nonetheless do something, by default it is throwing an error, but we said it to define those methods for us, hence magic. 

With great power comes great responsibility

You may have noted that the code for this magic is slightly less readable and understandable, hence your team won't pat you on the back for using it, and even if they will you will have to test it properly, otherwise buy a leg insurance, because you are gonna shoot it often.

Should I use it?

Yep, for lolz of course, it may even have its place in production code. For example, gem 'hashie' has a feature Mash which allows you to create objects that have attributes defined on the fly.

But remember that this technique has its drawbacks and may bite you in the ass. As Pablo Perrotta said it is kinda like a chainsaw, very powerful and potentially dangerous.

