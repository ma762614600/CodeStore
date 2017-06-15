/**
 * Created by mengai on 16/9/8.
 */
'use strcit';

import React,{Component} from 'react';

import {
    Text,
    View,
    StyleSheet
} from 'react-native';

/*变量类型*/
export default class StatementType extends Component{

    constructor(props){
        super(props);
        this.state = {
            name:'哈哈',
            imageArray:[]
        }
    }


    _test1() {
        //同一个循环,i变量用var和let声明,会出现不同的结果
        //var 10
        //let  6
        var a = [];
        for (var i = 0; i < 10; i++) {
            a[i] = function () {
                console.log(i);
            };
        }
        console.log('s打印word '+a[6]());
    }


    render(){
        this._test1();

        //const
        var myConst = () => {
            console.log(typeof (foo)); //短暂性死区
            const foo = 1;
            console.log(typeof (foo));
        };

        myConst();

        return(
            <View style={[{marginTop:200,marginLeft:100}]}>
                {this.state.imageArray}
            </View>
        )
    }
}

/*
*
* 总结:var 声明后,全局使用,在块级区域外也可以使用;可以先使用变量,后声明,会变量提升
*
* let 声明后,只能在块级区域内使用,let变量必须先声明,后使用,不然会出现短暂性死区
*
* const 声明后,变量内容不能改变,必须在声明时赋值.const的作用域与let命令相同：只在声明所在的块级作用域内有效。const命令声明的常量也是不提升，同样存在暂时性死区，只能在声明的位置后面使用。
*
* 函数声明:避免在块级作用域内声明函数。如果确实需要，也应该写成函数表达式，而不是函数声明语句。
*
* */