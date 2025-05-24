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

  go2 = (event: MouseEvent) => {
    // With a transition:
    // document.startViewTransition(() => {
    //   this.router.transitionTo('p1');
    // });
    document.startViewTransition({
      // @ts-expect-error: No types for these options yet
      update: () => {
        this.router.transitionTo('p2');
      },
      types: ['backwards'],
    });
  };

  <template>
    <style>
      :root {
        --direction: 1;
      }

      .page {
        view-transition-name: page;
      }
    </style>

    <div class="page">
      P3 here

      <button {{on "click" this.go2}} class="btn btn-primary" type="button">
        Go to P2
      </button>

    </div>
  </template>
}
