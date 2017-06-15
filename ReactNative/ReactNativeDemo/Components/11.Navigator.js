/**
 * Created by mengai on 16/9/20.
 */
import React, {Component, PropTypes} from 'react';
import {
    Navigator,
    Text,
    TouchableHighlight,
    View
} from 'react-native';

import FirstScene from './NavigatorTestFiles/FirstScene';
import SecondSecne from './NavigatorTestFiles/SecondSecne';


//导航跳转,都是用native的导航,很少用RN的导航

export default class SimpleNavigationApp extends Component {
    static render() {
        return (
            <Navigator
                initialRoute={{title: 'FirstScene'}}
                renderScene={(route, navigator) =>{

                switch (route.title) {
                    case "FirstScene" :
                        return (
                            <FirstScene title={route.title} navigator={navigator} />
                        )
                        break;
                    case "SecondSecne" :
                        return (
                            <SecondSecne title={route.title} navigator={navigator} />
                        )
                    break;
                }

                }}
            />
        )
    }
}
