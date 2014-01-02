0.1.3 / 2014-01-02 
==================

 * add og tags
 * fix index and show page font size
 * fix index page story detail font size
 * fix show page no image
 * fix index popup
 * fix index page story detail word wrap, closes #36
 * fix create story detail text area, closes #37
 * fix index page no picture, closes #35
 * change filter city btn to dropdown
 * Merge branch 'master' of github.com:cyanglee/bigheart into develop
 * fix mailer default from
 * add config.action_mailer.raise_delivery_errors = true
 * add config.action_mailer.delivery_method = :smtp
 * add config.action_mailer.perform_deliveries = true
 * add domain to production
 * fix mailer user name and password
 * remove env variables from config
 * ramove public assets
 * add i18n gem
 * fix seed for production
 * change migration file for heroku
 * move state machine
 * Merge branch 'release/0.1.2' into develop
 * Merge branch 'release/0.1.2'
 * bump version
 * Merge branch 'release/0.1.1'

0.1.2 / 2013-12-28 
==================

 * add sensitve info in to gitignore
 * Merge branch 'feature/testing_story_curd_and_state_machine' into develop
 * fix story show
 * fix a bit of state machine test
 * write test for story
 * update rspec and coderay
 * fix admin read unpublished story, add no image icon
 * redirect to manage story page after edit
 * set info from and story details to required
 * add facebook share and like button
 * change a bit of new story page ui
 * redesign appear day, add notification, set location as required in create and edit story
 * change font size in navbar, close #31
 * fix i18n warning
 * change a little bit of ui
 * add more discription to readme file
 * add discription in readme file
 * update readme
 * fix facebook app and secret
 * move story info from and resize report button in show story page
 * disable user register
 * try to add awsome font
 * use cancan on both users and stories controller
 * sending email to admin fixed
 * add feedback or report bug to navbar
 * redesign report story button
 * change navbar Bighert font style
 * fix index and show story page text size
 * add create story to seed
 * add admin edit story, use cancan for authorize, fix file for deploy
 * fix coderay errors by changing pry version
 * fix story show and index font size, close #22
 * add sign out btn to navbar for admin sign out
 * create feedback mailer, close #23
 * fix create story, close #24
 * only show pop up modal when first time using, closes #21
 * redesign navbar add modal, closes #19, closes #20
 * Merge branch 'release/0.1.1' into develop

0.1.1 / 2013-12-20 
==================

 * bundle updating sqlite3
 * Merge branch 'develop' of github.com:cyanglee/bigheart into develop
 * bundle updating sqlite3
 * Merge branch 'master' of github.com:cyanglee/bigheart
 * add faceook id and secret for develop to  application.yml
 * Merge branch 'master' of github.com:cyanglee/bigheart
 * edit application yml
 * trans reset password email
 * edit forgot password page and reset password email
 * edit resend email confirmation page
 * trans confirmation email
 * fix seed create admin confirmataion email
 * fix trans to pending state after edit story
 * change story details length limit
 * change mailer SMTP settings
 * change mailer password
 * remove domain name from mailer SMTP
 * finish index page slogan
 * change admin pw
 * change admin email
 * fix state migration
 * change oauth controller user class
 * add change state type migrate
 * add rails_12factor gem
 * change state type to integer
 * add assets to gitignore
 * Add asset precomipled files for heroku
 * Merge branch 'master' of github.com:cyanglee/bigheart
 * remove files from public/assets
 * move state_machine to the general group
 * move state machine out from development
 * Merge branch 'develop' of github.com:cyanglee/bigheart into develop
 * rename omniauth callback controller user class
 * add domain to mailer
 * add sqlite back to gemfile
 * move omniauth controller
 * add app id in production
 * comment out sqlite
 * bundle updating sqlite3 again
 * Merge branch 'release/0.1' into develop
 * Merge branch 'release/0.1'
 * bump version; update changelog
 * bundle updating sqlite3
 * move postgres out of the proudction block
 * ramove sqlite again
 * move sqlite to develop
 * reinstall sqlite
 * remove sqlite
 * trans state
 * Merge pull request #18 from cyanglee/feature/add_state_machine
 * redesign users stories page
 * finish manage state
 * finish story index page filtering city
 * Merge pull request #12 from cyanglee/feature/create_image_upload
 * add city and info column to stories
 * fix user sign up form
 * fix upload story page and story index page
 * finish upload file
 * combine edit and create story page to partial
 * Merge branch 'feature/stroy_index_page' into develop
 * install carrierwave gem
 * fix edit and create story page form
 * check user while edit and destroy story
 * fix form to bootstrap 3
 * add story block to story index page
 * fix navbar after sign in
 * link logo to story index and finish my post function
 * fix flash message after email confirm
 * fix destroy story error close #7
 * finish navbar
 * Merge pull request #6 from cyanglee/feature/log_in_with_facebook
 * add read all stories to navbar
 * add dropdown to navbar
 * finish navbar sign in block
 * add facebook login button
 * finish facbook log in back end part
 * stuck at facebook sign in
 * close #4
 * close #3
 * update gemfile.lock
 * Merge branch 'develop' of github.com:cyanglee/bigheart into develop
 * Merge branch 'feature/story_crud' into develop
 * post story english to chinese
 * Merge branch 'develop' of github.com:cyanglee/bigheart into develop
 * Add settings logic and be able to user seed.rb to create a default admin user
 * confirmation_email_received
 * Merge pull request #2 from cyanglee/feature/story_crud
 * finish_story_crud
 * Merge pull request #1 from cyanglee/feature/story_crud
 * create_new_story
 * rails_apps_composer: extras
 * rails_apps_composer: set up database
 * rails_apps_composer: rspec files
 * rails_apps_composer: add README files
 * rails_apps_composer: front-end framework
 * rails_apps_composer: routes
 * rails_apps_composer: views
 * rails_apps_composer: controllers
 * rails_apps_composer: models
 * rails_apps_composer: set email accounts
 * rails_apps_composer: testing framework
 * rails_apps_composer: generators
 * rails_apps_composer: create database
 * rails_apps_composer: Gemfile
 * rails_apps_composer: initial commit
0.1.0 / 2013-12-19 
==================

  * move postgres out of the proudction block
  * ramove sqlite again
  * move sqlite to develop
  * reinstall sqlite
  * remove sqlite
  * trans state
  * Merge pull request #18 from cyanglee/feature/add_state_machine
  * redesign users stories page
  * finish manage state
  * finish story index page filtering city
  * Merge pull request #12 from cyanglee/feature/create_image_upload
  * add city and info column to stories
  * fix user sign up form
  * fix upload story page and story index page
  * finish upload file
  * combine edit and create story page to partial
  * Merge branch 'feature/stroy_index_page' into develop
  * install carrierwave gem
  * fix edit and create story page form
  * check user while edit and destroy story
  * fix form to bootstrap 3
  * add story block to story index page
  * fix navbar after sign in
  * link logo to story index and finish my post function
  * fix flash message after email confirm
  * fix destroy story error close #7
  * finish navbar
  * Merge pull request #6 from cyanglee/feature/log_in_with_facebook
  * add read all stories to navbar
  * add dropdown to navbar
  * finish navbar sign in block
  * add facebook login button
  * finish facbook log in back end part
  * stuck at facebook sign in
  * close #4
  * close #3
  * update gemfile.lock
  * Merge branch 'develop' of github.com:cyanglee/bigheart into develop
  * Merge branch 'feature/story_crud' into develop
  * post story english to chinese
  * Merge branch 'develop' of github.com:cyanglee/bigheart into develop
  * Add settings logic and be able to user seed.rb to create a default admin user
  * confirmation_email_received
  * Merge pull request #2 from cyanglee/feature/story_crud
  * finish_story_crud
  * Merge pull request #1 from cyanglee/feature/story_crud
  * create_new_story
  * rails_apps_composer: extras
  * rails_apps_composer: set up database
  * rails_apps_composer: rspec files
  * rails_apps_composer: add README files
  * rails_apps_composer: front-end framework
  * rails_apps_composer: routes
  * rails_apps_composer: views
  * rails_apps_composer: controllers
  * rails_apps_composer: models
  * rails_apps_composer: set email accounts
  * rails_apps_composer: testing framework
  * rails_apps_composer: generators
  * rails_apps_composer: create database
  * rails_apps_composer: Gemfile
  * rails_apps_composer: initial commit
