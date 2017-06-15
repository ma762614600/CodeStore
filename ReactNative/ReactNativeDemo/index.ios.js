/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
'use strict';

import React, { Component } from 'react';
import {
  AppRegistry,
  StyleSheet,
  Text,
  View
} from 'react-native';

//import MyComponent from './Components/1.创建对象.js';
//import MyComponent from './Components/2.State与Props的使用.js';
//import MyComponent from './Components/3.函数.js';
//import MyComponent from './Components/4.Let与Var和Const.js';
//import MyComponent from './Components/5.数组和字典对象.js';
//import MyComponent from './Components/6.组件的生命周期.js';
//import MyComponent from './Components/Demo1_BlinkApp.js';
//import MyComponent from './Components/7.FlexBox布局.js';
//import MyComponent from './Components/8.TextInput.js';
//import MyComponent from './Components/9.ScrollView.js';
//import MyComponent from './Components/10.ListView.js';
// import MyComponent from './Components/11.Navigator.js';
import MyComponent from './Components/12.Image.js';
// import MyComponent from './Components/14.网络.js';
// import MyComponent from './Components/15.手势.js';
// import MyComponent from './Components/16.录音组件.js';
//import MyComponent from './Components/xxxxx.js';
//import MyComponent from './Components/xxxxx.js';





class ReactNativeDemo extends Component {
  render() {
        return (
            <MyComponent style = {styles.container}/>
        )
  }
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    justifyContent: 'center',
    alignItems: 'center',
    backgroundColor: '#F5FCFF'
  }
});

AppRegistry.registerComponent('ReactNativeDemo', () => ReactNativeDemo);
