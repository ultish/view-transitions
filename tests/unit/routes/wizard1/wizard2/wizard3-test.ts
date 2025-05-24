import { module, test } from 'qunit';
import { setupTest } from 'view-transitions/tests/helpers';

module('Unit | Route | wizard1/wizard2/wizard3', function (hooks) {
  setupTest(hooks);

  test('it exists', function (assert) {
    const route = this.owner.lookup('route:wizard1/wizard2/wizard3');
    assert.ok(route);
  });
});
