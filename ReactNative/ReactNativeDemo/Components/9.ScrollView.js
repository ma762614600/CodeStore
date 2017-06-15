/**
 * Created by mengai on 16/9/20.
 */
'use strict';

import React,{Component} from 'react';
import {
    Text,
    View,
    ScrollView,
    StyleSheet
} from 'react-native';


export default class ScrollViewDemo extends Component{

    render(){
        return(
            <ScrollView style={styles.container}>
                <View style={styles.viewStyle} />
                <Text style={{fontSize:14}}>If you like</Text>
                <View style={styles.viewStyle} />
                <Text style={{fontSize:14}}>If you like</Text>
                <View style={styles.viewStyle} />
            </ScrollView>
        )
    }
}

const styles = StyleSheet.create({
   container:{
       flex:1,
       backgroundColor:'skyblue'
   },
    viewStyle:{
        width:100,
        height:400,
        backgroundColor:'steelblue'
    }
});


/*
*
* ScrollView适合用来显示数量不多的滚动元素。放置在ScollView中的所有组件都会被渲染，哪怕有些组件因为内容太长被挤出了屏幕外。
*
* 如果你需要显示较长的滚动列表，那么应该使用功能差不多但性能更好的ListView组件。
*
* */




