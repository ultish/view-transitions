import Component from '@glimmer/component';
import { service } from '@ember/service';
import type RouterService from '@ember/routing/router-service';

export default class RouteWizard1 extends Component {
  @service declare router: RouterService;

  get wizard2Open() {
    return this.router.isActive('wizard1.wizard2');
  }

  <template>
    <div class="grid place-items-center content-start">
      <h1 class="text-4xl font-bold mb-4">Wizard 3</h1>
      <ul class="steps">
        <li class="step step-primary">Register</li>
        <li class="step step-primary">Choose plan</li>
        <li class="step">Purchase</li>
        <li class="step">Receive Product</li>
      </ul>ss
      <div class="wizard1Outlet">
        {{outlet}}
      </div>
    </div>
  </template>
}
