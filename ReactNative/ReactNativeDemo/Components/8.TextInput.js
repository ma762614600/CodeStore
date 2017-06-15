/**
 * Created by mengai on 2017/1/3.
 */

import React, {Component} from 'react';
import {
    Text,
    View,
    TextInput,
    SheetStyle
} from 'react-native';

export default class TextInputDemo extends Component {

    constructor(props) {
        super(props);
        this.state = {
            text: ''
        }
    }

    render() {

        return (
            <View style={{padding: 30}}>
                <TextInput style={{height:40, backgroundColor: 'gray'}}
                           placeholder={'用空格隔开'}
                           onChangeText={(text) => {
                               this.setState({text});
                           }}>
                </TextInput>
                <Text style={{fontSize: 14, padding: 10}}>
                    {this.state.text.split(' ').map((word) => word && '🤗').join(" ")}
                </Text>


            </View>
        )

    }


}
