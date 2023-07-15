import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Platform, SafeAreaView, View, Keyboard } from 'react-native';
import { useState, useEffect } from "react";

import {
  HomeScreen,
  LoginScreen,
  TrackScreen,
  BookScreen,
  BranchScreen,
  RateScreen,
} from './app/screens';

const Stack = createNativeStackNavigator();

let initialHeight = 0;

export default function App() {
  const [bottom, setBottom] = useState(0);
  const [keyboardHeight, setKeyboardHeight] = useState(0);

  useEffect(() => {
    if (Platform.OS === 'ios') {
      return Keyboard.addListener('keyboardWillChangeFrame', _updateBottomIfNecessary);
    }
  }, []);

  useEffect(() => {
    if (Platform.OS !== 'ios') {
        Keyboard.addListener('keyboardDidHide', _updateBottomIfNecessary);
    }
  }, []);

  useEffect(() => {
    if (Platform.OS !== 'ios') {
        Keyboard.addListener('keyboardDidShow', _updateBottomIfNecessary);
    }
  }, []);

  async function _updateBottomIfNecessary(event) {
    if (event.endCoordinates.height > 0) {
      setKeyboardHeight(event.endCoordinates.height);
    } else {
      setKeyboardHeight(0);
    }
  }

  return (
      <SafeAreaView
        style={{
          flex: 1,
          paddingBottom: bottom
        }}
        onLayout={(event) => {
          if (initialHeight === 0) {
            initialHeight = event.nativeEvent.layout.height;
            console.log("initialHeight is:", initialHeight);
          }
          setTimeout(() => {
            console.log("Keyboard height is:", keyboardHeight, initialHeight);
            if (Platform.OS === 'ios') {
              if (keyboardHeight > 0) {
                setBottom(initialHeight - keyboardHeight);
              } else {
                setBottom(0);
              }
            }
          }, 100);
        }}
        onStartShouldSetResponder={(event) => {
          Keyboard.dismiss();
          return keyboardHeight > 0;
        }}
        onMoveShouldSetResponder={(event) => {
          return false;
        }}
      >
        <NavigationContainer>
          <Stack.Navigator>
            <Stack.Screen name="Home" component={HomeScreen} />
            <Stack.Screen name="Login" component={LoginScreen} />
            <Stack.Screen name="Track" component={TrackScreen} />
            <Stack.Screen name="Book" component={BookScreen} />
            <Stack.Screen name="Rate" component={RateScreen} />
            <Stack.Screen name="Branch" component={BranchScreen} />
          </Stack.Navigator>
        </NavigationContainer>
      </SafeAreaView>

  );
}
