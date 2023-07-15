import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';
import { Platform, SafeAreaView, View, Keyboard } from 'react-native';
import { useState, useRef, useEffect } from "react";

import {
  HomeScreen,
  LoginScreen,
  TrackScreen,
  BookScreen,
  BranchScreen,
  RateScreen,
} from './app/screens';

const Stack = createNativeStackNavigator();

export default function App() {

  const initialHeight = useRef(0);
  const keyboardHeight = useRef(0);
  const clearTimer = useRef(-1);
  const [paddingBottom, setPaddingBottom] = useState(0);

  useEffect(() => {
    if (Platform.OS === 'ios') {
      return Keyboard.addListener('keyboardWillChangeFrame', updateBottomIfNecessary);
    }
  }, []);

  useEffect(() => {
    if (Platform.OS !== 'ios') {
        Keyboard.addListener('keyboardDidHide', updateBottomIfNecessary);
    }
  }, []);

  useEffect(() => {
    if (Platform.OS !== 'ios') {
        Keyboard.addListener('keyboardDidShow', updateBottomIfNecessary);
    }
  }, []);

  function updateBottomIfNecessary(event) {
    if (event.endCoordinates.height > 0) {
      keyboardHeight.current = event.endCoordinates.height;
    } else {
      keyboardHeight.current = 0;
    }
  }

  function onLayout(event) {
    if (clearTimer.current > -1) {
      clearTimeout(clearTimer);
      clearTimer.current = -1;
    }
    if (initialHeight.current === 0) {
      initialHeight.current = event.nativeEvent.layout.height;
      console.log("initialHeight is:", initialHeight.current);
    }
    clearTimer.current = setTimeout(() => {
      console.log("Keyboard height is:", keyboardHeight.current, initialHeight.current);
      if (Platform.OS === 'ios') {
        if (keyboardHeight.current > 0) {
          setPaddingBottom(initialHeight.current - keyboardHeight.current);
        } else {
          setPaddingBottom(0);
        }
      }
      clearTimer.current = -1;
    }, 100);
  }

  return (
      <SafeAreaView style={{ flex: 1, paddingBottom: paddingBottom }}
        onLayout={onLayout}
        onStartShouldSetResponder={(evt) => {
          Keyboard.dismiss();
          return keyboardHeight.current > 0;
        }}
        onMoveShouldSetResponder={(evt) => {
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
