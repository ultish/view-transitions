import { module, test } from 'qunit';
import { setupTest } from 'view-transitions/tests/helpers';

module('Unit | Service | loader', function (hooks) {
  setupTest(hooks);

  // TODO: Replace this with your real tests.
  test('it exists', function (assert) {
    const service = this.owner.lookup('service:loader');
    assert.ok(service);
  });
});
