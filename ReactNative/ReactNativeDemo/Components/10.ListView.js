/**
 * Created by mengai on 16/9/20.
 */
/**
 * Created by mengai on 16/9/20.
 */
'use strict';

import React,{Component} from 'react';
import {
    Text,
    View,
    ScrollView,
    StyleSheet,
    ListView
} from 'react-native';


export default class ScrollViewDemo extends Component{

    constructor(props){
        super(props);

        const ds = new ListView.DataSource({
            rowHasChanged:(x1,x2) => x1 !== x2,
        });


        //var arr = [ {
        //    'sectionTitle':'短标题',
        //    'array':['John', 'Joel', 'James', 'Jimmy', 'Jackson', 'Jillian', 'Julie', 'Devin']
        //},{
        //    'sectionTitle':'短标题',
        //    'array':['John', 'Joel', 'James', 'Jimmy', 'Jackson', 'Jillian', 'Julie', 'Devin']
        //},{
        //    'sectionTitle':'短标题',
        //    'array':['John', 'Joel', 'James', 'Jimmy', 'Jackson', 'Jillian', 'Julie', 'Devin']
        //},{
        //    'sectionTitle':'短标题',
        //    'array':['John', 'Joel', 'James', 'Jimmy', 'Jackson', 'Jillian', 'Julie', 'Devin']
        //},{
        //    'sectionTitle':'短标题',
        //    'array':['John', 'Joel', 'James', 'Jimmy', 'Jackson', 'Jillian', 'Julie', 'Devin']
        //}];
        //
        //console.log('arr =' + arr);

        this.state = {
            dataSource: ds.cloneWithRows(['John', 'Joel', 'James', 'Jimmy', 'Jackson', 'Jillian', 'Julie', 'Devin'])
        };
        console.log(this.state.dataSource)

    }

    renderRow (rowId,rowData){
        return (
            <View style={{flex:1,justifyContent:'center'}}>
                <Text style={{height:40,backgroundColor:'orange'}}>{rowData}</Text>
                <View style={{height:0.5,backgroundColor:"white"}}></View>
            </View>
        );
    }
//  renderSectionHeader={this.renderSectionHeader}

    renderSectionHeader (sectionData, sectionId) {
        return (<View>
            <Text style={styles.sectionHeaderStyle}>{sectionId}</Text>
        </View>);
    }

    render(rowData,sectionId,rowId){
        return(
            <View style={{paddingTop:22}}>
                <ListView style={{backgroundColor:'gray'}}
                    dataSource = {this.state.dataSource}
                    renderRow = {this.renderRow}
                />
            </View>
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







