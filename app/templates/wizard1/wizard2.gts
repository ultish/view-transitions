import Route from 'ember-route-template';

import { LinkTo } from '@ember/routing';

import Component from '@glimmer/component';
import { service } from '@ember/service';
import type RouterService from '@ember/routing/router-service';
import { on } from '@ember/modifier';
import { action } from '@ember/object';
import { fn } from '@ember/helper';

export default class RouteWizard2 extends Component {
  @service declare router: RouterService;

  get test() {
    return 'test';
  }

  get wizard3Open() {
    return this.router.isActive('wizard1.wizard2.wizard3');
  }
  // @action
  // goToWizard1(e) {
  //   // Trigger View Transition for the route change

  //   // eslint-disable-next-line @typescript-eslint/no-unsafe-call
  //   document.startViewTransition(() => {
  //     this.router.transitionTo('wizard1');
  //   });
  // }

  @action
  async goToWizard1(e) {
    // const wiz1 = document.getElementById('wizard1');
    // const wiz2 = document.getElementById('wizard2');
    // console.log(wiz1, wiz2);
    // // wiz1.style.viewTransitionName = 'back';
    // // wiz2.style.viewTransitionName = 'back';
    // // e.target.parentElement.classList.add('back-navigation');
    // wiz1.classList.add('back-navigation');
    // wiz2.classList.add('back-navigation');
    // const transition = document.startViewTransition(() => {
    //   console.log(wiz1?.classList, wiz2?.classList);
    //   wiz1.classList.add('back-navigation');
    //   console.log(wiz1?.classList, wiz2?.classList);
    //   // wiz1?.style?.viewTransitionName
    //   this.router.transitionTo('wizard1');
    // });
    // await transition.finished;
    // // wiz1.style.viewTransitionName = 'wizard-content';
    // // wiz2.style.viewTransitionName = 'wizard-content';
    // console.log('preremove', wiz1?.classList, wiz2?.classList);
    // wiz1.classList.remove('back-navigation');
    // wiz2.classList.remove('back-navigation');
    // console.log('remove', wiz1?.classList, wiz2?.classList);
    // // wiz1?.classList.remove('back-navigation');
    // // e.target.parentElement.classList.remove('back-navigation');
  }

  go1 = (event: MouseEvent) => {
    event.preventDefault();
    // event.target.parentElement.style.viewTransitionName = 'wizard-content-1';

    // With a transition:
    document.startViewTransition(async () => {
      // event.target.parentElement.style.viewTransitionName = 'wizard-content';
      await this.router.transitionTo('application');
    });
  };

  transitionToPokemonDetails = (direction: 'forwards' | 'backwards') => {
    // Fallback for browsers that don't support this API:

    // With a transition:
    document.startViewTransition({
      // @ts-expect-error: No types for these options yet
      update: () => {
        this.router.transitionTo('wizard1.index');
      },
      types: ['slide', direction],
    });
  };

  <template>
    {{! template-lint-disable no-forbidden-elements }}
    <style>
      #wizard2 {
        view-transition-name: wizard-content;
      }
    </style>
    <div
      id="wizard2"
      class="grid place-items-center content-start absolute"
      {{!-- {{if this.wizard3Open 'hidden'}}" --}}
      {{! style="view-transition-name: wizard-content;" }}
    >
      <h1 class="text-4xl font-bold mb-4">Wizard 2</h1>
      <ul class="steps">
        <li class="step step-primary">Register</li>
        <li class="step step-primary">Choose plan</li>
        <li class="step">Purchase</li>
        <li class="step">Receive Product</li>
      </ul>

      <button
        {{on "click" (fn this.transitionToPokemonDetails "backwards")}}
        class="btn btn-primary"
        type="button"
      >
        Go to Wizard 1
      </button>

      <LinkTo @route="wizard1" class="link mt-4">
        Wizard 1
      </LinkTo>
      {{!
      <LinkTo @route="wizard1.wizard2.wizard3" class="btn btn-primary mt-4">
        Wizard 3
      </LinkTo> }}

      {{! <div class="wizard2"> }}
      {{outlet}}
      {{! </div> }}
    </div>
  </template>
}
