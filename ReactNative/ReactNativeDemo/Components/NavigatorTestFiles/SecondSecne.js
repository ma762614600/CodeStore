/**
 * Created by mengai on 2017/1/4.
 */

import React, {Component, PropTypes} from 'react';
import {
    Navigator,
    Text,
    TouchableHighlight,
    View
} from 'react-native';



export default class SecondSecne extends Component {

    render(){
        return (
            <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
                <TouchableHighlight onPress={() => {
                    //2. 使用props获取传入的navigator并使用route对象作为参数，跳转到新的页面
                    this.props.navigator.push({name: 'Second'});
                }}>
                    <Text>{this.props.title}</Text>
                </TouchableHighlight>
            </View>
        );
    }
}