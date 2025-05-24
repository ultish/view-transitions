import Component from '@glimmer/component';
import { service } from '@ember/service';
import type RouterService from '@ember/routing/router-service';
import { LinkTo } from '@ember/routing';
import { on } from '@ember/modifier';
import { action } from '@ember/object';
import type LoaderService from 'view-transitions/services/loader';

export default class RouteWizard2 extends Component {
  @service declare router: RouterService;
  @service declare loader: LoaderService;

  go1 = (event: MouseEvent) => {
    // With a transition:
    // document.startViewTransition(() => {
    //   this.router.transitionTo('p1');
    // });
    document.startViewTransition({
      // @ts-expect-error: No types for these options yet
      update: () => {
        this.router.transitionTo('p1');
      },
      types: ['backwards'],
    });
  };

  go3 = (event: MouseEvent) => {
    document.startViewTransition({
      // @ts-expect-error: No types for these options yet
      update: () => {
        this.router.transitionTo('p3');
      },
      types: ['forwards'],
    });
  };

  <template>
    <style>
      .page {
        view-transition-name: page;
      }
    </style>

    <div class="page">
      P2 here

      <button {{on "click" this.go1}} class="btn btn-primary" type="button">
        Go to P1
      </button>
      <button {{on "click" this.go3}} class="btn btn-primary" type="button">
        Go to P3
      </button>
    </div>
  </template>
}
