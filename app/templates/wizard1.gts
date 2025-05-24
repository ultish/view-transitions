import Component from '@glimmer/component';
import { service } from '@ember/service';
import type RouterService from '@ember/routing/router-service';
import { LinkTo } from '@ember/routing';
import { on } from '@ember/modifier';
import { action } from '@ember/object';
import type LoaderService from 'view-transitions/services/loader';

export default class RouteWizard1 extends Component {
  @service declare router: RouterService;
  @service declare loader: LoaderService;

  get wizard2Open() {
    return this.router.isActive('wizard1.wizard2');
  }

  @action
  goToWizard2(e) {
    const wiz1 = document.getElementById('wizard1');
    // Trigger View Transition for the route change

    // eslint-disable-next-line @typescript-eslint/no-unsafe-call
    document.startViewTransition(() => {
      // wiz1.style.viewTransitionName = 'wizard-content';
      this.router.transitionTo('wizard1.wizard2');
    });
  }

  go = (event: MouseEvent) => {
    event.target.parentElement.style.viewTransitionName = 'wizard-content';

    // With a transition:
    document.startViewTransition(() => {
      event.target.parentElement.style.viewTransitionName = '';
      this.router.transitionTo('wizard1.wizard2');
    });
  };

  <template>
    {{! template-lint-disable no-forbidden-elements }}
    <style>
      #wizard1 {
        view-transition-name: wizard-content-1;
      }
    </style>

    {{#unless this.wizard2Open}}
      <div
        id="wizard1"
        class="grid place-items-center content-start absolute
          {{if this.wizard2Open 'top-[500px]left-[400[px]]'}}"
        {{! style="view-transition-name: wizard1-content;" }}
      >

        <h1 class="text-4xl font-bold mb-4">Wizard 1</h1>
        <ul class="steps">
          <li class="step step-primary">Register</li>
          <li class="step step-primary">Choose plan</li>
          <li class="step">Purchase</li>
          <li class="step">Receive Product</li>
        </ul>

        <button {{on "click" this.go}} class="btn btn-primary" type="button">
          Go to Wizard 2
        </button>

        <LinkTo @route="wizard1.wizard2" class="link mt-4">
          Wizard 2
        </LinkTo>

      </div>
    {{/unless}}
    <div
      id="wizard1Content"
      class="wizard1Outlet"
      style="view-transition-name: wizard-content2;"
    >
      {{outlet}}
    </div>
  </template>
}
