import 'react-native';
import React from 'react';
import { render, fireEvent } from '@testing-library/react-native';
import theHotness from './mock-the-hotness.json';
import gameDetails from './mock-game-details.json';
import { NavigationContainer } from '@react-navigation/native';
import { MyStack } from '../app/home';

const appRootStack = () => (
  <>
    <NavigationContainer>
      <MyStack />
    </NavigationContainer>
  </>
);

describe('Testing app screens', () => {
  beforeEach(() => {
    fetchMock.resetMocks();
  });

  test('game list contains expected games', async () => {
    fetchMock.mockResponseOnce(request => {
      expect(request.url).toEqual('http://localhost:38651/api/the-hotness');
      return Promise.resolve(JSON.stringify(theHotness));
    });

    const { findByText, getAllByText, getByText } = render(appRootStack());

    const woodenFish = await findByText('Intelligent Wooden Fish');
    const freshKeyboard = getByText('Tasty Fresh Keyboard');
    const all2020 = getAllByText('2020');

    expect(woodenFish).toBeTruthy();
    expect(freshKeyboard).toBeTruthy();
    expect(all2020.length).toBe(2);
  });

  test('tapping on game takes to details page', async () => {
    fetchMock.mockResponseOnce(JSON.stringify(theHotness));

    const { findByText } = render(appRootStack());
    const woodenFish = await findByText('Intelligent Wooden Fish');

    fetchMock.mockResponseOnce(JSON.stringify(gameDetails));

    fireEvent(woodenFish, 'press');

    const designerName = await findByText('Vincent Hand, Stella Kilback');

    expect(designerName).toBeTruthy();
  });
});
