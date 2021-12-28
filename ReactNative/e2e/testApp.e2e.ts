/* eslint-env detox/detox */
import { device } from 'detox';

describe('Example', () => {
  beforeAll(async () => {
    await device.launchApp();
  });

  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it('should have The Hotness list', async () => {
    await expect(element(by.text('The Hotness'))).toBeVisible();
  });

  it('should show game details after tap', async () => {
    await element(by.text('Ark Nova')).tap();
    await expect(element(by.text('Mathias Wigge'))).toBeVisible();
  });
});
