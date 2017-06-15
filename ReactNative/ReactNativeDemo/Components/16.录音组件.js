/**
 * Created by mengai on 2017/1/11.
 */


import React, {Component} from 'react';

import {
    AppRegistry,
    TouchableHighlight,
    StyleSheet,
    PanResponder,
    Text,
    View,
    Dimensions
} from 'react-native';


const NormalButtonTitle = '按住 说话';
const NormalButtonBackgroundColor = 'white';

const HighLightButtonTitle = '松开 发送';
const HightLightButtonBackgroundColor = 'gainsboro';


export default class Gusture extends Component {

    static propTypes = {
        extraOffset: React.PropTypes.number, //额外手势范围 default is 0
    };



    constructor(props) {
        super(props);

        this.buttonViewLayout;

        this.extraOffset = 100;

        this.isOut = false;

        this.isRecording = false;

        this.state = {
            pressStatus:0,
            buttonTitle:NormalButtonTitle,
            buttonBackgroundColor:NormalButtonBackgroundColor
        };


        this.onStartShouldSetPanResponder = this.onStartShouldSetPanResponder.bind(this);
        this.onMoveShouldSetPanResponder = this.onMoveShouldSetPanResponder.bind(this);
        this.onPanResponderGrant = this.onPanResponderGrant.bind(this);
        this.onPanResponderMove = this.onPanResponderMove.bind(this);
        this.onPanResponderEnd = this.onPanResponderEnd.bind(this);
    }

    //用户开始触摸屏幕的时候，是否愿意成为响应者；
    onStartShouldSetPanResponder(evt, gestureState) {
        return true;
    }

    //在每一个触摸点开始移动的时候，再询问一次是否响应触摸交互；
    onMoveShouldSetPanResponder(evt, gestureState) {
        return true;
    }

    // 开始手势操作。给用户一些视觉反馈，让他们知道发生了什么事情！
    onPanResponderGrant(evt, gestureState) {
        // alert('开始操作了');
        this.setState({
            pressStatus:1,
            buttonTitle:HighLightButtonTitle,
            buttonBackgroundColor:HightLightButtonBackgroundColor
        });
        this.isRecording = true;
        console.log('onPanResponderGrant...开始操作了');
    }

    onPanResponderMove(evt, gestureState) {
        // console.log('onPanResponderMove...开始移动了' + JSON.stringify(gestureState));

        let numberActiveTouches = gestureState.numberActiveTouches;
        let dx = gestureState.dx;
        let dy = gestureState.dy;
        let moveX = gestureState.moveX;
        let moveY = gestureState.moveY;

        if (numberActiveTouches != 1) {
            console.log('触摸超过或不足1个手指');
            return;
        }

        //获取当前view的frame
        //把手势控制在view相对范围内
        let offset = this.props.extraOffset ? this.props.extraOffset : 0;

        let minX = this.buttonViewLayout.x - offset;
        let maxX = this.buttonViewLayout.x + this.buttonViewLayout.width + offset;

        let minY = this.buttonViewLayout.y - offset;
        let maxY = this.buttonViewLayout.y + this.buttonViewLayout.height + offset;



        if (moveX < minX || moveX > maxX || moveY < minY || moveY > maxY) {
            console.log('手指移出范围>>>>>>>>');
            //手势移出范围
            this.isOut = true;
            this.isRecording = false;
            this.setState({
                pressStatus:2,
                buttonTitle:NormalButtonTitle,
                buttonBackgroundColor:NormalButtonBackgroundColor
            });
        } else {
            //手势在范围内
            if (this.isOut) {
                //手势移入范围
                //TODO 继续录音
                console.log("手势移入范围<<<<<<<");
                this.isRecording = true;
            } else {
                //手势一直都在 ，注意：即使一直在范围内，只要手指滑动，就会触发此方法
                if (this.isRecording) return;
            }
            console.log('======手势在范围内======');
            this.isOut = false;
            this.setState({
                pressStatus:1,
                buttonTitle:HighLightButtonTitle,
                buttonBackgroundColor:HightLightButtonBackgroundColor
            });
        }
    }

    // 用户放开了所有的触摸点，且此时视图已经成为了响应者。
    // 这意味着一个手势操作已经成功完成。
    onPanResponderEnd(evt, gestureState) {
        // alert('提示');
        console.log('onPanResponderEnd...手势结束了');
        this.setState({
            pressStatus:0,
            buttonTitle:NormalButtonTitle,
            buttonBackgroundColor:NormalButtonBackgroundColor
        });
        this.isRecording = false;
    }

    componentWillMount() {
        this._panResponder = PanResponder.create({
            // Ask to be the responder:
            onStartShouldSetPanResponder: (evt, gestureState) => true,
            onStartShouldSetPanResponderCapture: (evt, gestureState) => true,
            onMoveShouldSetPanResponder: (evt, gestureState) => true,
            onMoveShouldSetPanResponderCapture: (evt, gestureState) => true,

            onPanResponderGrant:this.onPanResponderGrant,
            onPanResponderMove:this.onPanResponderMove,
            // onPanResponderTerminationRequest: (evt, gestureState) => true,
            onPanResponderRelease:this.onPanResponderEnd,
            onPanResponderTerminate:this.onPanResponderEnd,
        });
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
                    <Text style={{fontSize:30, color:'red'}}>
                        松开取消发送
                    </Text>
                )
            }
                break;
        }
    }

    render() {
        return (
            <View style={{flex:1,position:'absolute',alignItems:'center'}}>

                <View style={{position:'absolute',marginTop:150,height:50,width:Dimensions.get('window').width, justifyContent:'center',alignItems:'center'}}>
                    {
                        this._recordView()
                    }
                </View>

                <View {...this._panResponder.panHandlers}
                      style={[styles.buttonStyle, {backgroundColor:this.state.buttonBackgroundColor}]}
                      onLayout={(event) => {
                          this.buttonViewLayout = event.nativeEvent.layout;
                      }}>
                    <Text style={{fontSize:25, color:'black'}}>
                        {this.state.buttonTitle}
                    </Text>
                </View>



            </View>

        )
    }
}


const styles = StyleSheet.create({
    buttonStyle:{
        position: 'absolute',
        width:Dimensions.get('window').width - 40,
        height:60,
        left:20,
        marginTop:500,
        justifyContent:'center',
        alignItems:'center',
        borderWidth:0.5,
        borderColor:'#bdbdbd'
    }
});