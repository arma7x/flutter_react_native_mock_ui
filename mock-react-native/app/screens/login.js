import { useState } from 'react';
import { Text, View, TextInput, FlatList } from 'react-native';

const DATA = [];

for (let i=1;i<=50;i++) {
    DATA.push({
        id: i.toString(),
        title: `Item ${i}`,
    });
}

export default function LoginScreen() {

    const [value, setValue] = useState("");

    return (
        <View style={{ flex: 1 }}>
            <FlatList
                data={DATA}
                renderItem={({item}) => <View style={{ flex: 1, flexDirection: 'row', justifyContent: 'center' }}><Text>{item.title}</Text></View>}
                keyExtractor={item => item.id}
            />
            <View style={{ flexDirection: 'row', alignItems: 'center' }}>
                <Text>ENTER: </Text>
                <View style={{ flex: 1 }}>
                    <TextInput value={value} style={{ backgroundColor: '#c0c0c0', padding: 5 }} onChangeText={setValue} placeholder="Enter any value" />
                </View>
            </View>
        </View>
    );
}
