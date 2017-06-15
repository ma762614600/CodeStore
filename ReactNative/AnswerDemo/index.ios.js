/**
 * Sample React Native App
 * https://github.com/facebook/react-native
 * @flow
 */
'use strict';

import React, { Component } from 'react';
import {
    AppRegistry,
    View,
    StyleSheet,
    Text,
    ScrollView,
} from 'react-native';
var Dimensions = require('Dimensions');

let maxWidth = 298;

let cellWidth = 298/3;

let answerArray = ['1','2','3'];


class AnswerDemo extends Component {
  render() {

    return (
        <View style={styles.container}>
          <ScrollView contentContainerStyle = {styles.contentContainer}
                      horizontal={true}
                      showsHorizontalScrollIndicator={true}
                      pagingEnabled={true}
                      bounces={false}
          >
            <View style={styles.content1}/>
            <View style={styles.content2}/>
            <View style={styles.content3}/>
          </ScrollView>
        </View>
    );
  }

    _createButtons() {

      for (var i = 0 ;i < answerArray.length; i ++)
      {

      }

      return (
          <View>
            <View style={styles.content1}/>
            <View style={styles.content2}/>
            <View style={styles.content3}/>
          </View>
      )
    }

}

const styles = StyleSheet.create({
  container:{
    height:256,
    padding:0,
    marginTop:Dimensions.get('window').height - 256,
    backgroundColor:'gray'
  },
  contentContainer: {
    height:256,
    backgroundColor: '#6A85B1'
  },
  content1:{
    flex:1,
    height:256,
    width:Dimensions.get('window').width,
    backgroundColor:'red'
  },
  content2:{
    flex:1,
    height:256,
    width:Dimensions.get('window').width,
    backgroundColor:'orange'
  },
  content3:{
    flex:1,
    height:256,
    width:Dimensions.get('window').width,
    backgroundColor:'brown'
  }
});
AppRegistry.registerComponent('AnswerDemo', () => AnswerDemo);
