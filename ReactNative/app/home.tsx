import { createNativeStackNavigator } from '@react-navigation/native-stack';
import React from 'react';
import { GameDetailsScreen } from './GameDetails/GameDetailsScreen';
import { GameList } from './GameList/GameList';
import { RootStackNavigationProps } from './navigation';

const Stack = createNativeStackNavigator<RootStackNavigationProps>();

export const MyStack = () => {
  return (
    <Stack.Navigator initialRouteName="GameList">
      <Stack.Screen name="GameList" component={GameList} options={{ title: 'The Hotness' }} />
      <Stack.Screen name="GameDetails" component={GameDetailsScreen} options={{ title: '' }} />
    </Stack.Navigator>
  );
};
