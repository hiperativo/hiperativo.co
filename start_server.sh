export $(heroku config --shell)
unset DATABASE_URL
unset RAILS_ENV
unset RACK_ENV
foreman start -p 12000