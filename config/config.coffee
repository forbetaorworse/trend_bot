
path = require 'path'
rootPath = path.normalize(__dirname + '/..')
templatePath = path.normalize(__dirname + '/../app/mailer/templates')

module.exports = 

  development:
    db: 'mongodb://admin:password@localhost:27017/hubot'
    root: rootPath
    app:
      name: 'TRENDSPACE'
    thirty7Signals:
      clientID: "APP_ID"
      clientSecret: "APP_SECRET"
      callbackURL: "http://APP_URL/auth/facebook/callback"

  test:
    db: 'mongodb://localhost/noobjs_test'
    root: rootPath
    app:
      name: 'TRENDSPACE (test)'
    thirty7Signals:
      clientID: "APP_ID"
      clientSecret: "APP_SECRET"
      callbackURL: "http://localhost:3000/auth/facebook/callback"

  production:
    db: 'mongodb://heroku:uoWm7Zmk-KNojIhIflT6IxMX0_5Hx8gHc15GZBSqPoWIGqKb6I_d3DLtuSLr_-P_0t7eYcLqg7xSsokyz1RXzw@oceanic.mongohq.com:10061/app9637361'
    root: rootPath
    app:
      name: 'TRENDSPACE'
    thirty7Signals:
      clientID: "APP_ID"
      clientSecret: "APP_SECRET"
      callbackURL: "http://localhost:3000/auth/facebook/callback"
}
