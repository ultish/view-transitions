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
    document.startViewTransition({
      // @ts-expect-error: No types for these options yet
      update: () => {
        this.router.transitionTo('s1.s2');
      },
      types: ['down'],
    });
  };

  get s2Open() {
    return this.router.isActive('s1.s2');
  }

  <template>
    <style>
      .page {
        view-transition-name: page;
      }
    </style>

    <div
      style={{if
        this.s2Open
        "view-transition-name: none"
        "view-transition-name: s"
      }}
    >
      {{#unless this.s2Open}}
        S1 Here

        <button {{on "click" this.go2}} class="btn btn-primary" type="button">
          Go to S2
        </button>
      {{/unless}}
      {{outlet}}

    </div>
  </template>
}
