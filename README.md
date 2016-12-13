Repro steps:

- `bin/rails s puma`
- visit `http://localhost:3000/test/alpha`
- click on "CLICK ME"
- click on "DELTA" in the new tab

Expected page content after that:
```
AT DELTA
SESSION: A,B,D,_csrf_token,session_id
COOKIES: A,B,C,D,_sample-session-race_session
```

Expected log content after that:
```
=> Booting Puma
=> Rails 4.2.7 application starting in development on http://localhost:3000
=> Run `rails server -h` for more startup options
=> Ctrl-C to shutdown server
Puma starting in single mode...
* Version 3.6.2 (ruby 2.3.1-p112), codename: Sleepy Sunday Serenity
* Min threads: 0, max threads: 16
* Environment: development
* Listening on tcp://localhost:3000
Use Ctrl-C to stop


Started GET "/test/alpha" for 127.0.0.1 at 2016-12-14 07:11:58 +1100
Processing by TestController#alpha as HTML
SESSION BEFORE:A,B,D,_csrf_token,session_id
COOKIES BEFORE:A,B,C,D,_sample-session-race_session
  Rendered test/alpha.html.erb within layouts/application (0.9ms)
SESSION AFTER:A,_csrf_token
COOKIES AFTER:A
Completed 200 OK in 184ms (Views: 175.5ms | ActiveRecord: 0.0ms)


Started GET "/test/charlie" for 127.0.0.1 at 2016-12-14 07:12:37 +1100
Processing by TestController#charlie as HTML
SESSION BEFORE:A,_csrf_token,session_id
COOKIES BEFORE:A,_sample-session-race_session
  Rendered test/charlie.html.erb within layouts/application (0.5ms)
SESSION AFTER:A,C,_csrf_token,session_id
COOKIES AFTER:A,C,_sample-session-race_session
Completed 200 OK in 2011ms (Views: 10.5ms | ActiveRecord: 0.0ms)


Started GET "/test/bravo" for 127.0.0.1 at 2016-12-14 07:12:39 +1100
Processing by TestController#bravo as */*
SESSION BEFORE:A,_csrf_token,session_id
COOKIES BEFORE:A,_sample-session-race_session
  Rendered test/bravo.html.erb within layouts/application (0.4ms)
SESSION AFTER:A,B,_csrf_token,session_id
COOKIES AFTER:A,B,_sample-session-race_session
Completed 200 OK in 20ms (Views: 19.4ms | ActiveRecord: 0.0ms)


Started GET "/test/delta" for 127.0.0.1 at 2016-12-14 07:12:40 +1100
Processing by TestController#delta as HTML
SESSION BEFORE:A,B,_csrf_token,session_id
COOKIES BEFORE:A,B,C,_sample-session-race_session
  Rendered test/delta.html.erb within layouts/application (0.5ms)
SESSION AFTER:A,B,D,_csrf_token,session_id
COOKIES AFTER:A,B,C,D,_sample-session-race_session
Completed 200 OK in 39ms (Views: 38.1ms | ActiveRecord: 0.0ms)
```
