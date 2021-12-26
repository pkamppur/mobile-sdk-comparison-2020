import { RouteProp } from '@react-navigation/native';
import { StackNavigationProp } from '@react-navigation/stack';
import * as React from 'react';
import {
  ActivityIndicator,
  SafeAreaView,
  StyleSheet,
  View,
} from 'react-native';
import { ScrollView } from 'react-native-gesture-handler';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { BGGApi } from '../BGGApi/BGGApi';
import { GameDetails } from '../BGGApi/GameDetails';
import { GameDescription } from './GameDescription';
import { GameImageTitle } from './GameImageTitle';
import { GameInfo } from './GameInfo';

type RootStackNavigationProps = {
  GameDatailsScreen: { gameId: string };
};

type GameDatailsNavigationProps = StackNavigationProp<
  RootStackNavigationProps,
  'GameDatailsScreen'
>;

type GameDatailsRouteProps = RouteProp<
  RootStackNavigationProps,
  'GameDatailsScreen'
>;

type Props = {
  route: GameDatailsRouteProps;
  navigation: GameDatailsNavigationProps;
};

interface GameDetailsState {
  details?: GameDetails;
}
export const GameDetailsScreen = ({ route, navigation }: Props) => {
  const gameId = route.params.gameId;

  const [state, setState] = React.useState<GameDetailsState>({
    details: undefined,
  });

  React.useEffect(() => {
    BGGApi.fetchGameDetails(gameId)
      .then(details => {
        console.log('did load details:');
        navigation.setOptions({ title: details.name });
        setState({ details: details });
      })
      .catch(e => {
        console.log(e);
      });
  }, [gameId, navigation]);

  const details = state.details;
  if (!details) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator />
      </View>
    );
  } else {
    return (
      <SafeAreaView>
        <ScrollView>
          <View style={styles.screenContainer}>
            <GameImageTitle details={details} />
            <GameInfo details={details} />
            <GameDescription details={details} />
          </View>
        </ScrollView>
      </SafeAreaView>
    );
  }
};

const styles = StyleSheet.create({
  loadingContainer: {
    backgroundColor: Colors.white,
    flex: 1,
    justifyContent: 'center',
  },
  screenContainer: {
    backgroundColor: Colors.white,
    flex: 1,
  },
  titleContainer: {
    flexDirection: 'row',
    alignItems: 'baseline',
    justifyContent: 'center',
    padding: 10,
  },
  titleText: {
    fontSize: 20,
    fontWeight: 'bold',
  },
  coverImageContainer: {
    backgroundColor: Colors.black,
  },
  coverImage: {
    width: '100%',
    maxHeight: 300,
    backgroundColor: Colors.orange,
  },
  title: {
    color: Colors.white,
  },
  yearPublished: {
    color: '#999',
  },
});
