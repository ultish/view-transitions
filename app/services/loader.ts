import Service from '@ember/service';
import { tracked } from '@glimmer/tracking';

export default class LoaderService extends Service {
  @tracked resolveComponentReady = null;

  createTransitionPromise() {
    return new Promise((resolve) => {
      this.resolveComponentReady = resolve;
    });
  }

  clearResolver() {
    this.resolveComponentReady = null;
  }
}

// Don't remove this declaration: this is what enables TypeScript to resolve
// this service using `Owner.lookup('service:loader')`, as well
// as to check when you pass the service name as an argument to the decorator,
// like `@service('loader') declare altName: LoaderService;`.
declare module '@ember/service' {
  interface Registry {
    loader: LoaderService;
  }
}
