require 'sinatra/base'

require('./controllers/application')
require('./controllers/list')
require('./controllers/account')
require('./models/list')
require('./models/account')

map('/') { run ListController }
map('/account') { run AccountController }
