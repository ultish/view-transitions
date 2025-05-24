import EmberRouter from '@embroider/router';
import config from 'view-transitions/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('p1');
  this.route('p2');
  this.route('p3');
  this.route('s1', function () {
    this.route('s2');
  });
});
