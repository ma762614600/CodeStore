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

export default class FirstScene extends Component {

    render() {
        return (
            <View style={{ flex: 1, alignItems: 'center', justifyContent: 'center' }}>
                <TouchableHighlight onPress={() => {
                    //2. 使用传入的导航控制器进行跳转，返回上一页
                    this.props.navigator.pop();
                }}>
                    <Text>{this.props.title}</Text>
                </TouchableHighlight>
            </View>
        );
    }
}
