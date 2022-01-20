import { NativeStackScreenProps } from '@react-navigation/native-stack';
import React, { useEffect, useState } from 'react';
import { ActivityIndicator, FlatList, StyleSheet, TouchableHighlight, View } from 'react-native';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { BGGApi } from '../BGGApi/BGGApi';
import { Game } from '../BGGApi/Game';
import { RootStackNavigationProps } from '../navigation';
import { GameRow } from './GameRow';

interface GameListState {
  games?: Game[];
}

type GameListProps = NativeStackScreenProps<RootStackNavigationProps, 'GameList'>;

export const GameList = ({ navigation }: GameListProps) => {
  const [state, setState] = useState<GameListState>({ games: undefined });

  useEffect(() => {
    BGGApi.fetchTheHotness()
      .then(games => {
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
          const showGameDetails = () => navigation.navigate('GameDetails', { gameId: item.id });
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
