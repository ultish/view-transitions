import { action } from '@ember/object';
import Route from '@ember/routing/route';
import type Transition from '@ember/routing/transition';

export default class Wizard1Wizard2Route extends Route {
  @action
  async willTransition(transition: Transition) {
    // debugger;
    // const wiz1 = document.getElementById('wizard1');
    // const wiz2 = document.getElementById('wizard1Content');
    // if (transition.to?.name === 'wizard1.index') {
    //   if (wiz1 && wiz2) {
    //     // wiz1.style.viewTransitionName = 'back';
    //     wiz2.style.viewTransitionName = 'back2';
    //   }
    // }
    console.log(`Wizard1: Transitioning to ${transition.to?.name}`);
    const x = document.startViewTransition(() => transition.retry());
    // await x.finished;
    // if (wiz1 && wiz2) {
    //   wiz1.style.viewTransitionName = 'wizard-content';
    //   wiz2.style.viewTransitionName = 'wizard-content2';
    // }
  }
}
