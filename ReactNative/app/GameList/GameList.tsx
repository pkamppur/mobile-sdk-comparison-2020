import { StackNavigationProp } from '@react-navigation/stack';
import * as React from 'react';
import {
  ActivityIndicator,
  FlatList,
  StyleSheet,
  TouchableHighlight,
  View,
} from 'react-native';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { BGGApi } from '../BGGApi/BGGApi';
import { Game } from '../BGGApi/Game';
import { GameRow } from './GameRow';

interface GameListState {
  games?: Game[];
}

interface GameListProps {
  navigation: StackNavigationProp<any>;
}

export const GameList = ({ navigation }: GameListProps) => {
  const [state, setState] = React.useState<GameListState>({ games: undefined });

  React.useEffect(() => {
    BGGApi.fetchTheHotness()
      .then(games => {
        console.log('did load games');
        setState({ games: games });
      })
      .catch(e => {
        console.log(e);
      });
  }, []);

  if (!state.games) {
    return (
      <View style={styles.loadingContainer}>
        <ActivityIndicator />
      </View>
    );
  } else {
    return (
      <FlatList
        ItemSeparatorComponent={FlatListItemSeparator}
        data={state.games}
        renderItem={({ item }) => {
          const showGameDetails = () =>
            navigation.navigate('GameDatailsScreen', { gameId: item.id });
          return (
            <TouchableHighlight onPress={showGameDetails}>
              <GameRow game={item} />
            </TouchableHighlight>
          );
        }}
      />
    );
  }
};

const FlatListItemSeparator = () => {
  return <View style={styles.separator} />;
};

const styles = StyleSheet.create({
  loadingContainer: {
    backgroundColor: Colors.white,
    flex: 1,
    justifyContent: 'center',
  },
  separator: {
    height: 1,
    width: '100%',
    backgroundColor: '#ddd',
  },
});
