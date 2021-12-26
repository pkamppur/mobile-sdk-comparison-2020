import * as React from 'react';
import { StyleSheet, Text, View } from 'react-native';
import { GameDetails } from '../BGGApi/GameDetails';

export const GameInfo = ({ details }: { details: GameDetails }) => {
  return (
    <View style={styles.infoContainer}>
      <View style={styles.infoTable}>
        <View style={[styles.infoCell, styles.rightBorderDivider]}>
          <Text style={styles.infoTitle}>
            {details.playersMin}—{details.playersMax} Players
          </Text>
          <Text style={styles.infoDescription}>Best {details.playersBest}</Text>
        </View>
        <View style={styles.infoCell}>
          <Text style={styles.infoTitle}>
            {details.playingTimeMin}—{details.playingTimeMax} Min
          </Text>
          <Text style={styles.infoDescription}>Playing Time</Text>
        </View>
      </View>
      <View style={[styles.divider, styles.infoTableDividerPadding]} />
      <View style={styles.creditsContainer}>
        <View style={styles.creditsRow}>
          <Text style={styles.creditsLabel}>Designer: </Text>
          <Text style={styles.creditsValue}>
            {details.designers.map(x => x.name).join(', ')}
          </Text>
        </View>
        <View style={styles.creditsRow}>
          <Text style={styles.creditsLabel}>Artist: </Text>
          <Text style={styles.creditsValue}>
            {details.artists.map(x => x.name).join(', ')}
          </Text>
        </View>
        <View style={styles.creditsRow}>
          <Text style={styles.creditsLabel}>Publisher: </Text>
          <Text style={styles.creditsValue}>
            {details.publishers[0].name} + {details.publishers.length - 1} More
          </Text>
        </View>
      </View>
    </View>
  );
};

const styles = StyleSheet.create({
  infoContainer: {
    height: undefined,
    backgroundColor: '#ddd',
  },
  infoTable: {
    flexDirection: 'row',
    alignItems: 'flex-start',
    justifyContent: 'center',
  },
  infoCell: {
    flex: 1,
    flexBasis: '50%',
    alignItems: 'center',
    padding: 10,
  },
  rightBorderDivider: {
    borderEndColor: '#aaa',
    borderEndWidth: 1,
  },
  infoTitle: {
    fontSize: 18,
    fontWeight: 'bold',
  },
  infoDescription: {
    paddingTop: 1,
  },
  divider: {
    height: 1,
    backgroundColor: '#aaa',
  },
  infoTableDividerPadding: {
    marginStart: 12,
    marginEnd: 12,
  },
  creditsContainer: {
    flexDirection: 'column',
    padding: 10,
  },
  creditsRow: {
    width: '99%',
    flexDirection: 'row',
    margin: 2,
  },
  creditsLabel: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  creditsValue: {
    fontSize: 16,
    flex: 1,
    flexWrap: 'wrap',
  },
});
