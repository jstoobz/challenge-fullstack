import EmberRouter from '@ember/routing/router'
import config from 'peek-client/config/environment'

export default class Router extends EmberRouter {
  location = config.locationType
  rootURL = config.rootURL
}

Router.map(function () {
  this.route('not-found', { path: '/*path' })
})
