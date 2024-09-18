# private_events

Rails application built to specification of [TOP private events
project](https://www.theodinproject.com/lessons/ruby-on-rails-private-events)

## Assignment

1. Build and migrate your Event model without any foreign keys or validations. Include the event’s date in your model but don’t worry about doing anything special with it yet.
1. Create the EventsController and add an #index action that will display all of the events. Create a corresponding view and add a heading with your choice of wording.
1. Set up devise to handle authentication and create your User model. Set the root_path to be the Event’s Index page.
1. Add the association between the event creator (a User) and the event. Call this user the “creator”. Add the foreign key to the Event model as necessary. You’ll need to specify your association properties carefully (e.g. :foreign_key, :class_name).
1. Have the User’s Show page list all the events a user has created.
1. Update the EventsController and corresponding routes to allow you to create a new event. The #create action should use the #build association reference method to create the new event with the user’s ID prepopulated. Find the right #build association reference method for the type of association you set up between your models. You could use Event’s ::new method and manually enter the ID but… don’t.
1. Make the form for creating an event.
1. Have the Event’s Show page display the details of the event.

### Event attendance

1. Add the association between the event attendee (also a User) and the event. Call this user the “attendee”. Call the event the “attended_event”. You’ll again need to juggle specially named foreign keys and classes and sources.
1. Create and migrate all necessary tables and foreign keys. This will require a “through” table since an Event can have many Attendees and a single User (Attendee) can attend many Events… many-to-many.
1. Create a Controller and corresponding routes for the “through” table that will allow a user to become an “attendee” of an event. This will also require creating some sort of interface in the view(s) where the user can indicate that they want to attend an event.
1. Update the Event’s Show page to display a list of attendees.
1. Add to the User’s Show page a list of their “attended_events”.
1. Separate this list of “attended_events” into either events that have occurred in the past or events that will occur in the future. You’ll get some good practice building queries and working with dates. Keep this logic in the view and do not put separate method calls in the controller.
1. Finishing touches
1. Separate the past and upcoming events on the Event’s Index page by creating two class methods on the Event model (e.g. Event.past).
1. Refactor the past and upcoming class methods into scopes.
1. Put navigation links across the top to help you jump around.
1. Extra Credit: Allow users to edit and delete the events they created.
1. Extra Credit: Allow users to remove themselves as an attendee to their “attended_events”.
1. Extra Credit: Make each event private and add the functionality for the event
   creator to invite specific users to an event.
