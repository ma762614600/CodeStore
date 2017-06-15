/**
 * Created by mengai on 16/9/7.
 */

'use strict';

//一个类中定义多个对象
import React, {Component} from 'react';
import {
    StyleSheet,
    Text,
    View
} from 'react-native';

//名字
class Name extends Component {
    render(){
        return (
            <Text >
                {this.props.name}
            </Text>
        )
    }
}

//链接
class Link extends Component {
    render(){
        return (
            <Text>
                {this.props.link}
            </Text>
        )
    }
}

//网页对象，包含Link对象和Name对象
class WebSite extends Component {
    render(){
        return (
            <View style={styles.container}>
                <Name name={this.props.name} />
                <Link link={this.props.link} />
            </View>
        )
    }
}

//导出对象
export default class CreateObject extends Component {
    render() {
        return (
            <WebSite name="开开心心" link="www.baidu.com" />
        )
    }
}

const styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF'
    },
    welcome: {
        fontSize: 20,
        textAlign: 'center',
        margin: 10
    }
});


/*
* 总结:
*
* 一个类中可以创建多个对象,供主对象调用,输出主对象(export default class CreateObject extends Component)
*
* 给子对象赋值:调用一个子对象时,可以直接给对象赋属性和值,比如:name 和 lick
* 子对象取值:子对象通过this.props.xxx 进行取值,比如:this.props.name
*
* */