import { StatusBar } from 'expo-status-bar';
import { StyleSheet, Text, View, Dimensions, TouchableOpacity, Button } from 'react-native';

export default function HomeScreen({ navigation }) {
  return (
    <View style={styles.container}>
      <StatusBar style="auto" />
      <View style={styles.topContainer}>
        <Text>Top</Text>
        <View style={styles.loginButtonContainer}>
          <TouchableOpacity style={styles.loginButton} onPress={() => navigation.navigate('Login')}>
            <Text>LOGIN</Text>
          </TouchableOpacity>
        </View>
      </View>
      <View style={styles.bottomContainer}>
        <Text>Bottom</Text>
      </View>
      <View style={styles.middleContainer}>
        <Button
            title="Track"
            onPress={() => navigation.navigate('Track')}
        />
        <Button
            title="Book"
            onPress={() => navigation.navigate('Book')}
        />
        <Button
            title="Rate"
            onPress={() => navigation.navigate('Rate')}
        />
        <Button
            title="Branch"
            onPress={() => navigation.navigate('Branch')}
        />
      </View>
    </View>
  );
}

const windowHeight = Dimensions.get('window').height;
const windowWidth = Dimensions.get('window').width;

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#fff',
    alignItems: 'center',
    justifyContent: 'center',
  },
  topContainer: {
    position: 'relative',
    backgroundColor: 'red',
    alignItems: 'center',
    justifyContent: 'center',
    width: '100%',
    height: windowHeight * 0.3
  },
  loginButtonContainer: {
    position: 'absolute',
    alignItems: 'center',
    justifyContent: 'center',
    width: 60,
    height: 60,
    left: 25,
    top: ((windowHeight * 0.3) / 2) - (60 / 2),
  },
  loginButton: {
    width: 60,
    height: 60,
    alignItems: 'center',
    justifyContent: 'center',
    backgroundColor: '#DDDDDD',
    padding: 10,
    borderRadius: 30,
  },
  bottomContainer: {
    flex: 1,
    backgroundColor: 'green',
    alignItems: 'center',
    justifyContent: 'center',
    width: '100%',
  },
  middleContainer: {
    position: 'absolute',
    top: (windowHeight * 0.3) - (70/2),
    left: 25,
    flexDirection: 'row',
    alignItems: 'center',
    justifyContent: 'space-between',
    padding: 5,
    borderRadius: 10,
    backgroundColor: 'yellow',
    width: windowWidth - 50,
    height: 70,
  }
});
