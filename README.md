Kneading Harmony app
by Rene Arellano

An appointment app, where client/admin can display availability.  Interested parties can create an account, check availability and schedule sessions.
<img width="1005" alt="screen shot 2016-07-13 at 5 14 15 pm" src="https://cloud.githubusercontent.com/assets/12709735/16824692/ae4eea7e-4922-11e6-852e-e2de1ee49e2a.png">


### Technologies
- Ruby on Rails
- Bootstrap
- PostgresSQL db
- Sass

### Necessary Gems
- gem "simple_form"
- gem 'jbuilder', '~> 2.0'

### User Stories
- Splash page has jumbotron, user attention brought to login/signup
- If user is logged in the button becomes a create timeslot button
- Navbar allows quick access to scheduling appointments and exploring available timeslots
- Below Jumbotron FAQ with links to services, about me and scheduling
- Profile has a name and email and all scheduled appointments
- From the profile page, user can schedule appointments, delete or edit profile
- Graceful fail on all validations, to guide user.

### Entity Relationship Model
- Model User has_many appointments, timeslots
- Model Appointments belongs_to users, timeslots
- Model Timeslot has_one appointment

##### Purpose:
I created this app to dabble with calenders, basic authorization and nested models.  On diff branches I created a calender, used datePicker gem and ended up prefering simple_form gem.

##Future development
- I will refactor timeslots to a single form where admin can check boxes to set availability.
- Appointment scheduling should reflect avaible timeslots.
- I will add payment method with Stripe
- I will establish an admin attribute, so all users cannot set timeslots
