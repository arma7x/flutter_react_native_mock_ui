import {
    StyleSheet,
    Text,
    View,
    Dimensions,
    TouchableOpacity,
    Button,
    TextInput,
    FlatList,
} from 'react-native';

const DATA = [];

for (let i=0;i<50;i++) {
    DATA.push({
        id: i.toString(),
        title: `Item ${i}`,
    });
}

export default function LoginScreen() {

  return (
      <View style={{ flex: 1 }}>
        <FlatList
            data={DATA}
            renderItem={({item}) => <View style={{ flex: 1, flexDirection: 'row', justifyContent: 'center' }}><Text>{item.title}</Text></View>}
            keyExtractor={item => item.id}
        />
        <TextInput value={"1234"}/>
      </View>
  );
}
