import { Text, View } from 'react-native';
import { createMaterialTopTabNavigator } from '@react-navigation/material-top-tabs';

const Tab = createMaterialTopTabNavigator();

export default function BookScreen() {
  return (
    <Tab.Navigator>
      <Tab.Screen name="BookTab" component={BookTab} options={{ tabBarLabel: 'Book' }}/>
      <Tab.Screen name="HistoryTab" component={HistoryTab} options={{ tabBarLabel: 'History' }}/>
    </Tab.Navigator>
  );
}

function BookTab() {

  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>Book Tab</Text>
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
