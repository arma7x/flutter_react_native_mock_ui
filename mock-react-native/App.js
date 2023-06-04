import { NavigationContainer } from '@react-navigation/native';
import { createNativeStackNavigator } from '@react-navigation/native-stack';

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
  return (
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
  );
}
