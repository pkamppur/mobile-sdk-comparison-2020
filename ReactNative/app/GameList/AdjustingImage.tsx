import React, { useState, useEffect } from 'react';
import {
  Image,
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
  source: string;
  style?: StyleProp<ViewStyle>;
}) => {
  const [containerWidth, setContainerWidth] = useState(0);
  const [containerHeight, setContainerHeight] = useState(0);
  const [imageWidth, setImageWidth] = useState(0);
  const [imageHeight, setImageHeight] = useState(0);

  useEffect(() => {
    Image.getSize(source, (width, height) => {
      setImageWidth(width);
      setImageHeight(height);
    });
  }, [source]);

  const widthScale = containerWidth / Math.max(imageWidth, 1);

  const scale = widthScale;
  const imageViewWidth = imageWidth * scale;
  const imageViewHeight = imageHeight * scale;

  return (
    <View
      style={style}
      onLayout={(e: LayoutChangeEvent) => {
        var newWidth = e.nativeEvent.layout.width;
        var newHeight = e.nativeEvent.layout.height;

        if (newWidth !== containerWidth) {
          setContainerWidth(newWidth);
        }
        if (newHeight !== containerHeight) {
          setContainerHeight(newHeight);
        }
      }}>
      <Image
        style={style as ImageStyle}
        resizeMode={'contain'}
        width={imageViewWidth}
        height={imageViewHeight}
        source={{ uri: source }}
      />
    </View>
  );
};
