/* eslint-env detox/detox */
import { device } from 'detox';
import express from 'express';
import http from 'http';
import theHotness from '../__tests__/mock-the-hotness.json';
import gameDetails from '../__tests__/mock-game-details.json';

let server: http.Server;

describe('Example', () => {
  beforeAll(async () => {
    const app = express();

    app.get('/api/the-hotness', (req, res) => {
      res.json(theHotness);
    });

    app.get('/api/games/10001/details', (req, res) => {
      res.json(gameDetails);
    });

    await new Promise<void>(function (resolve) {
      server = app.listen(38651, '127.0.0.1', () => {
        console.log(` Running server on '${JSON.stringify(server.address())}'...`);
        resolve();
      });
    });
  });

  afterAll(() => {
    server.close();
  });

  beforeAll(async () => {
    await device.launchApp();
  });

  beforeEach(async () => {
    await device.reloadReactNative();
  });

  it('should show game list, and then game details after tap', async () => {
    await expect(element(by.text('The Hotness'))).toBeVisible();

    await element(by.text('Intelligent Wooden Fish')).tap();
    await expect(element(by.text('Vincent Hand, Stella Kilback'))).toBeVisible();
  });
});
