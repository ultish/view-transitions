import EmberRouter from '@embroider/router';
import config from 'view-transitions/config/environment';

export default class Router extends EmberRouter {
  location = config.locationType;
  rootURL = config.rootURL;
}

Router.map(function () {
  this.route('wizard1', function () {
    this.route('wizard2', function () {
      this.route('wizard3');
    });
  });
  this.route('p1');
  this.route('p2');
  this.route('p3');
});
