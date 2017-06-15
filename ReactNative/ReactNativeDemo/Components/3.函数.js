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


export default class MyFunction extends Component {

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
                <Text style={styles.textStyle} onPress={()=>this._press()} >{text}</Text>
            </View>
        )
    }
}

//调用函数方式:
//方式一: onPress={this._press.bind(this)}
//方式二: onPress={()=>this._press()}


/*
 ()=>1
 v=>v+1
 (a,b)=>a+b
 ()=>{
 alert("foo");
 }
 e=>{
 if (e == 0){
 return 0;
 }
 return 1000/e;
 }
*/

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
 * 注意:Text的onPress需要绑定this
 *
 * 在ES5下，React.createClass会把所有的方法都bind一遍，这样可以提交到任意的地方作为回调函数，而this不会变化。但官方现在逐步认为这反而是不标准、不易理解的。
 *
 * 在ES6下，你需要通过bind来绑定this引用，或者使用箭头函数（它会绑定当前scope的this引用）来调用
 *
 * 箭头函数:箭头函数实际上是在这里定义了一个临时的函数，箭头函数的箭头=>之前是一个空括号、单个的参数名、或用括号括起的多个参数名，而箭头之后可以是一个表达式（作为函数的返回值），或者是用花括号括起的函数体（需要自行通过return来返回值，否则返回的是undefined）。
 *
 * 需要注意的是，不论是bind还是箭头函数，每次被执行都返回的是一个新的函数引用，因此如果你还需要函数的引用去做一些别的事情（譬如卸载监听器），那么你必须自己保存这个引用
 *
 * */