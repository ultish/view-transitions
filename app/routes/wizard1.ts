import { action } from '@ember/object';
import Route from '@ember/routing/route';
import type Transition from '@ember/routing/transition';
import { service } from '@ember/service';
import type LoaderService from 'view-transitions/services/loader';

export default class Wizard1Route extends Route {
  @service declare loader: LoaderService;
  // didTransition(): boolean | void {
  //   debugger;
  //   console.log('Wizard1: Transitioned');
  //   // document.startViewTransition(() => transition.retry());
  //   return true;
  // }
  componentReadyPromise: Promise<unknown> | null = null;

  // @action
  // willTransition(transition: Transition) {
  //   console.log(`Wizard1: Transitioning to ${transition.to?.name}`);
  //   // if (transition.to?.name === 'wizard1.wizard2.index') {
  //   //   this.componentReadyPromise = this.loader.createTransitionPromise();

  //   //   document.startViewTransition(async () => {
  //   //     await transition.retry();
  //   //     // await this.componentReadyPromise;
  //   //   });
  //   // }
  // }
}
