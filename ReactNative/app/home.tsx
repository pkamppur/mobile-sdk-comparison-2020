import {
  createNativeStackNavigator,
  NativeStackNavigationProp,
} from '@react-navigation/native-stack';
import * as React from 'react';
import { SafeAreaView, StyleSheet } from 'react-native';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { GameDetailsScreen } from './GameDetails/GameDetailsScreen';
import { GameList } from './GameList/GameList';

type RootStackNavigationProps = {
  Home: undefined;
  GameDatailsScreen: { gameId: string };
};

const Stack = createNativeStackNavigator<RootStackNavigationProps>();

export const MyStack = () => {
  return (
    <Stack.Navigator>
      <Stack.Screen
        name="Home"
        component={HomeScreen}
        options={{ title: 'The Hotness' }}
      />
      <Stack.Screen
        name="GameDatailsScreen"
        component={GameDetailsScreen}
        options={{ title: '' }}
      />
    </Stack.Navigator>
  );
};

interface HomeScreenProps {
  navigation: NativeStackNavigationProp<any>;
}

const HomeScreen = ({ navigation }: HomeScreenProps) => {
  return (
    <SafeAreaView style={styles.navigation}>
      <GameList navigation={navigation} />
    </SafeAreaView>
  );
};

const styles = StyleSheet.create({
  navigation: {
    backgroundColor: Colors.white,
    flex: 1,
  },
});
