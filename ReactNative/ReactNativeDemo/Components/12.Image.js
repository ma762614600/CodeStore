/**
 * Created by mengai on 16/9/23.
 */
'use strict';

import React,{Component} from 'react';
import {
    Text,
    View,
    Image,
    ScrollView,
    StyleSheet
} from 'react-native';

var Dimensions = require('Dimensions');
var SCREEN_WIDTH = Dimensions.get('window').width;

/*
    <Image style={styles.imageStyle1} source={{"__packager_asset":true,"isStatic":true,"path":"./images/caoyuan.png","uri":"caoyuan.png","width":SCREEN_WIDTH,"height":10}} />

 <Image style={styles.imageStyle2} source={require('./images/senlin.png')} />

 <Image style={{width: SCREEN_WIDTH, height: 188}} source={{uri: 'native-senlin.jpg'}} />

 <Image style={{width: SCREEN_WIDTH, height: 120*SCREEN_WIDTH/600}} source={{uri: 'banner'}}>
 <Text>
 哈哈哈
 </Text>
 </Image>

 <Image source={{uri: 'https://facebook.github.io/react/img/logo_og.png'}}
 style={{width: SCREEN_WIDTH, height: SCREEN_WIDTH}} />

 <ScrollView style={styles.container}>


</ScrollView>

 */



export default class ImageDemo extends Component{

    render(){
        return(
            <View style={styles.container}>
                <Image style={styles.imageStyle1}
                       source={require('./images/robot_left_bubble.png')}
                       capInsets={{top: 10, left: 10, right: 10, bottom:10}}
                />
            </View>
        )
    }
}

const styles = StyleSheet.create({
    container:{
        backgroundColor:'skyblue',
        width:SCREEN_WIDTH,
        height:300
    },
    imageStyle1:{
        resizeMode:'strecth',
        marginTop:200,
        marginLeft:100,
        // width:SCREEN_WIDTH,
        backgroundColor:'steelblue'
    },
    imageStyle2:{
        width:SCREEN_WIDTH,
        height:188,
        backgroundColor:'steelblue'
    }
});

/*
* 只能使用png格式,不能使用jpg格式
*
* 图片来源:
* 1.静态图片,来自react-native中的图,加载方式:直接使用require加载,不需要指定尺寸
*
* 2.静态图片,来自native中的图,加载方式如上面:native-senlin.png,需要指定尺寸
*
* 3.静态图片,来自native imageSet中的图片,加载方式:banner.png ,需要指定尺寸
*
* 4.网络图片,来自API请求动态加载,加载方式:react-native的logo,需要指定尺寸
*
* */