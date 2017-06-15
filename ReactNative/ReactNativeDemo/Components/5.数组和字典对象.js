/**
 * Created by mengai on 16/9/9.
 */

import React, {Component} from 'react';

import {
    View,
    Text,
    StyleSheet
} from 'react-native';


export default class ArrayAndDictory extends Component {


    state = {
        //要求title必须是string型
        title:React.PropTypes.string.isRequired,
    }


    render(){

        let [x, , y] = [1, 2, 3];
        x // 1
        y // 3
        console.log(x)
        console.log(y)


        // 报错
        //let [foo] = 1;
        //let [foo] = false;
        //let [foo] = NaN;
        //let [foo] = undefined;
        //let [foo] = null;
        //let [foo] = {};


        let [head, ...tail] = [1, 2, 3, 4];
        console.log(head) // 1
        console.log(tail) // [2, 3, 4]
        console.log(tail[2])


        //给变量赋默认值
        var [foo1 = true] = [false];
        foo1 // true
        console.log(foo1)


        return (
            <View />
        )
    }
}