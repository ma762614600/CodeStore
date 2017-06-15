/**
 * Created by mengai on 2017/1/5.
 */

import React,{ Component } from 'react';
import {
    AppRegistry,
    TouchableHighlight,
    StyleSheet,
    Text,
    View
} from 'react-native';

const RED_COLOR = 'red';
const WHITE_COLOR = 'white';

export default class TouchableDemo extends Component {


    constructor(props) {
        super(props);
        this.state = {
            pressStatus:0,
            bg:'white'

        }
    }

    _onPressButton(){
        console.log('按钮被点击');
    }


    _onLongPress(){
        console.log('长按');
        this.setState({pressStatus:1});
    }

    _onPressIn(){
        console.log('Press In');
        this.setState({pressStatus:1});
    }

    _onPressOut(){
        console.log('Press Out');
        this.setState({pressStatus:2});
    }
    _recordView(){
        switch (this.state.pressStatus) {
            case 0: //初始状态
            {
                return null;
            }
                break;
            case 1: //上滑取消录音
            {
                return (
                    <Text style={{fontSize:30, color:'deepskyblue'}}>
                        上滑取消录音
                    </Text>
                )
            }
                break;
            case 2: //松开取消发送
            {
                return (
                    <Text style={{fontSize:30, color:'floralwhite'}}>
                        松开取消发送
                    </Text>
                )
            }
                break;
        }
    }




    /*

     <TouchableHighlight style={[{marginTop:100,backgroundColor:"ghostwhite",width:200,height:50,justifyContent:"center",alignItems:'center'},]}
     activeOpacity={0}
     onPress={this._onPressButton.bind(this)}
     onPressIn={this._onPressIn.bind(this)}
     onPressOut={this._onPressOut.bind(this)}
     onLongPress={this._onLongPress.bind(this)}
     underlayColor='gainsboro'
     >
     <Text style={{fontSize:18}}>按住 说话</Text>
     </TouchableHighlight>

    * */


//this.state.pressStatus ? {backgroundColor: RED_COLOR} : {backgroundColor: WHITE_COLOR}



    componentWillMount(){
        this._gestureHandlers = {
            onStartShouldSetResponder: () => {
                console.log('开始响应');
                return true;
            },
            onMoveShouldSetResponder: ()=> {
                console.log('是否应该响应');
                return true;
            },
            onResponderGrant: ()=>{
                this.setState({bg: 'red'});
                console.log('被激活')
            },
            onResponderMove: ()=>{
                console.log('移动')
            },
            onResponderRelease: ()=>{
                this.setState({bg: 'white'});
                console.log('结束')
            }
        }
    }


    render(){
        return (
            <View style={{flex:1,backgroundColor:'mediumslateblue',justifyContent:'center',alignItems:'center'}}>
                <View {...this._gestureHandlers} style={[styles.rect,{
                    "backgroundColor": this.state.bg
                }]}>

                </View>

                <View style={{marginTop:50,alignItems:'center'}}>
                    {
                        this._recordView()
                    }
                </View>



            </View>
        )
    }


}

var styles = StyleSheet.create({
    container: {
        flex: 1,
        justifyContent: 'center',
        alignItems: 'center',
        backgroundColor: '#F5FCFF',
    },
    rect: {
        width: 200,
        height: 200,
        borderWidth: 1,
        borderColor: 'black'
    }
});


/*
*
* 注意：在调用函数时，如果在函数结尾加了括号,就表示立即执行，例如：onPress={this._onPressButton()}
*
* 不加括号，则表示函数引用，例如：onPress={this._onPressButton}
*
*
* */