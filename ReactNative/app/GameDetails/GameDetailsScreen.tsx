import { NativeStackScreenProps } from '@react-navigation/native-stack';
import React, { useEffect, useState } from 'react';
import { ActivityIndicator, SafeAreaView, StyleSheet, View } from 'react-native';
import { ScrollView } from 'react-native-gesture-handler';
import { Colors } from 'react-native/Libraries/NewAppScreen';
import { BGGApi } from '../BGGApi/BGGApi';
import { GameDetails } from '../BGGApi/GameDetails';
import { RootStackNavigationProps } from '../navigation';
import { GameDescription } from './GameDescription';
import { GameImageTitle } from './GameImageTitle';
import { GameInfo } from './GameInfo';

type GameDetailsProps = NativeStackScreenProps<RootStackNavigationProps, 'GameDetails'>;

export const GameDetailsScreen = ({ route, navigation }: GameDetailsProps) => {
  const gameId = route.params.gameId;

  const [details, setDetails] = useState<GameDetails | undefined>(undefined);

  useEffect(() => {
    BGGApi.fetchGameDetails(gameId)
      .then(newDetails => {
        navigation.setOptions({ title: newDetails.name });
        setDetails(newDetails);
      })
      .catch(e => {
        console.log(e);
      });
  }, [gameId, navigation]);

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
