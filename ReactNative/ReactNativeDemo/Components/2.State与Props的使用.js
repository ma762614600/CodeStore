/**
 * Created by mengai on 16/9/7.
 */

import React,{Component} from 'react';
import {
    View,
    Text,
    TouchableOpacity,
    StyleSheet,
} from 'react-native'

/*
*  注:通过点击改变liked的值,来触发state刷新界面
* */


export default class StateAndProps extends Component {

    //初始化方式一: (不推荐)
    /*
    state = {
        liked: false
    };*/

    //初始化方式二 (推荐)
    constructor(props){
        super(props);
        this.state = {
            liked: false
        }
    }

    _press(){
        this.setState({
            liked:!this.state.liked
        });
    }


    render() {

        var text = this.state.liked ? "喜欢" : "不喜欢";
        return (
            <View style={styles.contrainer}>
                    <Text style={styles.textStyle} onPress={this._press.bind(this)}>{text}</Text>
            </View>
        )
    }
}

var styles = StyleSheet.create({
    contrainer:{
        backgroundColor:'red',
        marginTop:200,
        marginLeft:100,
        width:100,
        height:40
    },
    textStyle:{
        flex:1,
        justifyContent:'center',
        alignItems:'center',
        textAlign:'center'
    }
});


/*
* 总结:
*
* state 和 props 主要的区别在于 props 是不可变的，而 state 可以根据与用户交互来改变。这就是为什么有些容器组件需要定义 state 来更新和修改数据。 而子组件只能通过 props 来传递数据。
*
*
* ①初始化state:有上方例子中两种方法,推荐方式二;因为方式二更易理解,而且在构造函数中初始化（这样你还可以根据需要做一些计算）：
*
* ②
* props是上个类中传递过来的参数
*
* state是监听页面状态,如果有值的变化,就会刷新界面
*
*③
* 注意:Text的onPress需要绑定this
*
* 在ES5下，React.createClass会把所有的方法都bind一遍，这样可以提交到任意的地方作为回调函数，而this不会变化。但官方现在逐步认为这反而是不标准、不易理解的。
*
* 在ES6下，你需要通过bind来绑定this引用，或者使用箭头函数（它会绑定当前scope的this引用）来调用
*
* ※ 注意哪些函数调用绑定this
*
*
* */





