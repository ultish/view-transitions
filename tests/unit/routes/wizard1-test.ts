import { module, test } from 'qunit';
import { setupTest } from 'view-transitions/tests/helpers';

module('Unit | Route | wizard1', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const route = this.owner.lookup('route:wizard1');
    assert.ok(route);
  });
});
