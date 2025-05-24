import Route from 'ember-route-template';
import { pageTitle } from 'ember-page-title';

import '../styles/app.css';
import { LinkTo } from '@ember/routing';

export default Route(
  <template>
    {{pageTitle "ViewTransitions"}}

    <h2 id="title" class="bg-info text-info-content">Welcome to Ember</h2>

    <LinkTo @route="wizard1" class="btn btn-primary">Wizard 1</LinkTo>

    <LinkTo @route="p1" class="btn btn-primary">P1</LinkTo>

    <LinkTo @route="s1" class="btn btn-primary">S1</LinkTo>

    {{outlet}}
  </template>,
);
