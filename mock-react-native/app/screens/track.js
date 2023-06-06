import { Text, View } from 'react-native';
import { createMaterialTopTabNavigator } from '@react-navigation/material-top-tabs';

const Tab = createMaterialTopTabNavigator();

export default function TrackScreen() {
  return (
    <Tab.Navigator>
      <Tab.Screen name="TrackTab" component={TrackTab} options={{ tabBarLabel: 'Track' }}/>
      <Tab.Screen name="HistoryTab" component={HistoryTab} options={{ tabBarLabel: 'History' }}/>
    </Tab.Navigator>
  );
}

function TrackTab() {

  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>Track Tab</Text>
    </View>
  );
}

function HistoryTab() {

  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>History Tab</Text>
    </View>
  );
}
