# Ten Best in San Fransisco

Ten Best in San Fransisco Application was written in ruby on rails back end and bootstrap3 + jQuery front end using Google Map API, Google Place Search API, Google Photo API.


* Ruby version 
	* ruby 2.3.1

* System dependencies
	* rails 5.0.0
	* sass-rails 5.0
	* postgresql (production environment)
	* sqlite3 (development environment)
	* Read Gemfile for the more...

* Configuration
	* Smtp mail configuration: <p>config/secrets.yml<br>
							  mailer_user: xxx@gmail.com<br>
 							  mailer_pass: xxxxxxx
						</p>
	* Google map and Place configuration: <p>config/secrets.yml<br>
										  google_map_key: xxxxxxx-xxxx<br>
										  google_place_key: xxxxxxx-xxxx<br>
										  google_photo_key: xxxxxxx-xxxx
										  </p>
	* Social share button configuration: <p>config/initializer/social_share_button.rb<br>
										    config.allow_sites = %w(xxx xxxxx xxxxx)<br>
										    ex: facebook, twitter...
										  </p>

* Database creation & initialization
	* local: <p>>> rails db:migrate</p>
	* heroku: <p>>> heroku run rake db:migrate</p>

* How to run the test suite<br>
	* Test app: <p>>> rails test<br>
				Running via Spring preloader in process 35879<br>
				Started with run options --seed 30263<br>

				logo/16: [=====================             ] 64% Time: 00:00:13,  ETA: 00:00:08
				logo/18: [========================          ] 72% Time: 00:00:16,  ETA: 00:00:06
				logo/22: [=============================     ] 88% Time: 00:00:17,  ETA: 00:00:03
				logo/23: [===============================   ] 92% Time: 00:00:19,  ETA: 00:00:02
				  25/25: [=================================] 100% Time: 00:00:21, Time: 00:00:21

				Finished in 21.60776s
				25 tests, 35 assertions, 0 failures, 0 errors, 0 skips
				
	* IndexController: <p>>> rails test test/controllers/index_controller_test.rb<br>
					 >> ....<br>
					 >> Finished in 1.616466s, 2.4745 runs/s, 4.9491 assertions/s.<br>
					 >>	4 runs, 8 assertions, 0 failures, 0 errors, 0 skips<br></p>
	* Test Models: <p>>>rails test:models <br>
					>>...<br>
					>>Finished in 0.438195s, 27.3851 runs/s, 27.3851 assertions/s.<br>
					>>12 runs, 12 assertions, 0 failures, 0 errors, 0 skips<br>
					</p>

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
