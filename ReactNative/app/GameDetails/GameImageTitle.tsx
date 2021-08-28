import * as React from 'react';
import {StyleSheet, Text, View} from 'react-native';
import {Colors} from 'react-native/Libraries/NewAppScreen';
import {GameDetails} from '../BGGApi/GameDetails';
import {AdjustingImage} from '../GameList/AdjustingImage';

export const GameImageTitle = ({details}: {details: GameDetails}) => {
  return (
    <View style={styles.coverImageContainer}>
      <AdjustingImage style={styles.coverImage} source={details.imageUrl} />
      <View style={styles.titleContainer}>
        <Text style={[styles.titleText, styles.title]}>{details.name}</Text>
        <Text style={[styles.titleText, styles.yearPublished]}>
          {' ' + details.yearPublished}
        </Text>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  titleContainer: {
    flexDirection: 'row',
    alignItems: 'baseline',
    justifyContent: 'flex-start',
    padding: 10,
    paddingTop: 15,
    paddingBottom: 15,
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
