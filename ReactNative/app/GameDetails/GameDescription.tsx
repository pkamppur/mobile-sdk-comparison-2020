import * as React from 'react';
import { StyleProp, StyleSheet, Text, View, ViewStyle } from 'react-native';
import { GameDetails, Link as GameDetailsLink } from '../BGGApi/GameDetails';

export const GameDescription = ({ details }: { details: GameDetails }) => {
  return (
    <View style={styles.descriptionContainer}>
      <Text style={styles.descriptionTitle}>Description</Text>
      <View style={styles.divider} />
      <View style={styles.categoriesContainer}>
        <Category title="Category" content={details.categories} />
        <Category
          title="Mechanisms"
          content={details.mechanisms}
          style={styles.categoryPadding}
        />
        <Category
          title="Family"
          content={details.families}
          style={styles.categoryPadding}
        />
      </View>
      <Text style={styles.descriptionText}>{details.description}</Text>
    </View>
  );
};

const Category = ({
  title,
  content,
  style,
}: {
  title: string;
  content: GameDetailsLink[];
  style?: StyleProp<ViewStyle>;
}) => {
  return (
    <View style={style}>
      <Text style={styles.categoryTitle}>{title}</Text>
      {content.map(x => (
        <Text key={x.id} style={styles.categoryContents}>
          {x.name}
        </Text>
      ))}
    </View>
  );
};

const styles = StyleSheet.create({
  divider: {
    height: 1,
    backgroundColor: '#aaa',
  },
  descriptionContainer: {
    backgroundColor: 'white',
    padding: 20,
  },
  descriptionTitle: {
    fontSize: 20,
    fontWeight: 'bold',
    paddingBottom: 10,
  },
  descriptionText: {
    paddingTop: 20,
    fontSize: 16,
  },
  categoriesContainer: {
    marginTop: 10,
    backgroundColor: '#f4f4f4',
    padding: 10,
  },
  categoryTitle: {
    fontSize: 16,
    fontWeight: 'bold',
  },
  categoryPadding: {
    paddingTop: 20,
  },
  categoryContents: {
    paddingTop: 3,
    fontSize: 16,
  },
});
