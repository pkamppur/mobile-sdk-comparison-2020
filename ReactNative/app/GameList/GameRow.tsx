import * as React from 'react';
import { Image, StyleSheet, Text, View } from 'react-native';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { Game } from '../BGGApi/Game';

export const GameRow = ({ game }: { game: Game }) => {
  return (
    <View style={styles.gameRow}>
      <Image style={styles.thumbnail} source={{ uri: game.thumbnailUrl }} />
      <View style={styles.textContainer}>
        <Text style={styles.title}>{game.name}</Text>
        <Text style={styles.yearPublished}>{game.yearPublished}</Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  gameRow: {
    backgroundColor: Colors.white,
    padding: 10,
    flex: 1,
    flexDirection: 'row',
  },
  textContainer: {
    padding: 10,
    flex: 1,
    flexDirection: 'column',
    justifyContent: 'center',
    alignItems: 'flex-start',
  },
  thumbnail: {
    width: 80,
    height: 80,
    resizeMode: 'cover',
    borderRadius: 5,
    overflow: 'hidden',
  },
  title: {
    fontSize: 18,
  },
  yearPublished: {
    marginTop: 1,
    fontSize: 14,
    color: '#999',
  },
});
