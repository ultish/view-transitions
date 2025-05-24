import { module, test } from 'qunit';
import { setupTest } from 'view-transitions/tests/helpers';

module('Unit | Route | p3', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const route = this.owner.lookup('route:p3');
    assert.ok(route);
  });
});
