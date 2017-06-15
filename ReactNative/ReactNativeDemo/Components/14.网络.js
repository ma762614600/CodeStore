/**
 * Created by mengai on 2017/1/4.
 */
import React,{Component} from 'react';
import {
    View,
    Text,
    TouchableOpacity,
    StyleSheet,
} from 'react-native'

export default class NetWorkDemo extends Component {



    componentDidMount() {
        this.getMoviesFromApiAsync();
    }

    getMoviesFromApiAsync() {
        return fetch('http://facebook.github.io/react-native/movies.json')
            .then((response) => response.json())
            .then((responseJson) => {
                return responseJson.movies;
            })
            .catch((error) => {
                console.error(error);
            });
    }



    render(){
        return (
            <View style={{marginTop:20,padding:20,height:50,backgroundColor:'skyblue'}}>

            </View>
        )
    }

}