import * as React from 'react';
import {
  ImageSourcePropType,
  LayoutChangeEvent,
  StyleProp,
  View,
  ViewStyle,
} from 'react-native';
import ScalableImage, {IImageProps} from 'react-native-scalable-image';

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
      <ScalableImage
        style={style as IImageProps}
        resizeMode={'contain'}
        width={imageWidth}
        source={source}
      />
    </View>
  );
};
