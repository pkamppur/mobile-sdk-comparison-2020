module.exports = {
  root: true,
  extends: '@react-native-community',
  plugins: ['detox-bcp'],
  env: {
    'detox/detox': true,
    jest: true,
    'jest/globals': true,
  },
  globals: {
    'fetchMock': false
  }
};
