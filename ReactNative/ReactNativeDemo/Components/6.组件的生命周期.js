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

//网页对象
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

    constructor(props) {
        super(props);
        console.log('0.组件初始化_constructor')
    }

    componentWillMount(){
        console.log('1.将要被渲染_componentWillMount')
    }

    componentDidMount(){
        console.log('2.已经被渲染_componentDidMount')
    }

    componentWillReceiveProps(){
        console.log('3.在组件接收到一个新的prop时被调用_componentWillReceiveProps')
    }

    shouldComponentUpdate(){
        console.log('4.在组件接收到新的props或者state时被调用_shouldComponentUpdate')
    }

    componentWillUpdate(){
        console.log('5.在组件接收到新的props或者state但还没有render时被调用_componentWillUpdate')
    }

    componentDidUpdate(){
        console.log('6.在组件完成更新后立即调用_componentDidUpdate')
    }

    componentWillUnmount(){
        console.log('7.在组件从 DOM 中移除的时候立刻被调用_componentWillUnmount')
    }


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

