**Environment:**
Ruby 3.0.0
Rails 7.0.2.3
Postgresql
Bootstrap 5
SCSS
Devise
Pundit
Github
Heroku

**Requirements:**

**Super Admin:**
Login through active admin and can create Project Managers and
have the power to do anything in the system.

**Project Manager:**
Can log in and edit his profile.
Create/archive/edit Projects.
Add/remove developers/QA
Create/View/edit/archive project bugs and features
Can only access his own created projects and their resources(bugs, features)

**QA:**
Can sign up/log in and edit his profile
Access projects which they have access to and their resources (features, bugs)
Report and edit bugs, edit features and add comments and pictures
Assign bugs to developers

**Developer:**
Can sign up/log in and edit his profile
Access projects which they have access to and their resources (features, bugs)
Change their assigned bugs and features status and can add comments.

**Features:**
Email notifications for Developer/QA when added to a project, for the
developer when assigned a new bug/feature.
Feature statuses(new, in progress, in review, completed)
Bug statuses(new, in progress, in review, fixed)
The developer can change status (new -> inprogress, inprogress -> inreview)
