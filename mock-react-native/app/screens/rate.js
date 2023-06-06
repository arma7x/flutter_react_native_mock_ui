import { Text, View } from 'react-native';
import { createMaterialTopTabNavigator } from '@react-navigation/material-top-tabs';

const Tab = createMaterialTopTabNavigator();

export default function RateScreen() {
  return (
    <Tab.Navigator>
      <Tab.Screen name="DomesticTab" component={DomesticTab} options={{ tabBarLabel: 'Domestic' }}/>
      <Tab.Screen name="InternationalTab" component={InternationalTab} options={{ tabBarLabel: 'International' }}/>
    </Tab.Navigator>
  );
}

function DomesticTab() {

  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>Domestic Tab</Text>
    </View>
  );
}

function InternationalTab() {

  return (
    <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
      <Text>International Tab</Text>
    </View>
  );
}
