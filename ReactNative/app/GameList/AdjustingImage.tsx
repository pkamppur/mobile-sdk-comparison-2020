import * as React from 'react';
import {
  Image,
  ImageSourcePropType,
  ImageStyle,
  LayoutChangeEvent,
  StyleProp,
  View,
  ViewStyle,
} from 'react-native';

export const AdjustingImage = ({
  source,
  style,
}: {
  source: ImageSourcePropType;
  style?: StyleProp<ViewStyle>;
}) => {
  const [imageWidth, setImageWidth] = React.useState(0);
  return (
    <View
      style={style}
      onLayout={(e: LayoutChangeEvent) => {
        var newWidth = e.nativeEvent.layout.width;
        if (imageWidth !== newWidth) {
          setImageWidth(newWidth);
        }
      }}>
      <Image
        style={style as ImageStyle}
        resizeMode={'contain'}
        width={imageWidth}
        source={source}
      />
    </View>
  );
};
