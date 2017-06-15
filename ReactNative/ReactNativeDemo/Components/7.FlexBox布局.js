/**
 * Created by mengai on 16/9/20.
 */
import React, { Component } from 'react';
import { AppRegistry, View } from 'react-native';

export default class FlexDirectionBasics extends Component {
    render() {
        return (
            // 尝试把`flexDirection`改为`column`看看
            <View style={{flex: 1,flexDirection: 'row', justifyContent: 'center',alignItems: 'flex-end',}}>
                <View style={{width:80, height: 80, backgroundColor: 'powderblue'}} />
                <View style={{width:80, height: 80, backgroundColor: 'skyblue'}} />
                <View style={{width:80, height: 80, backgroundColor: 'steelblue'}} />
            </View>
        );
    }
};



/*
* 最常用的三种样式属性:flexDirection、justifyContent和 alignItems
*
*
* 1.flexDirection:用来指定主轴方向: "row" or "column"     row代表水平轴方向,column代表竖直轴方向。默认是column,竖直方向是主轴。
*
* 2.justifyContent:在组件的style中指定justifyContent,可以决定其子元素沿着主轴的排列方式, 默认是贴边，选项有："flex-start","flex-end","center","space-around","space-between"
* ①"flex-start":    从主轴的起始位置紧挨着排列,
* ②"flex-end":      从主轴的结束位置紧挨着排列,
* ③"center":        从主轴的中心位置紧挨着排列,
* ④"space-around":  控件左右边全部均等排列,
* ⑤"space-between": 两头控件贴边，其他均等排列
*
* 3.alignItems:在组件的style中指定alignItems可以决定其子元素沿着次轴（与主轴垂直的轴，比如若主轴方向为row，则次轴方向为column）的排列方式,默认值是stretch。
* alignItems对应的这些可选项有：flex-start、center、flex-end以及stretch(伸缩)
* 注意：要使stretch选项生效的话，子元素在次轴方向上不能有固定的尺寸。
*
*
* React Native中的Flexbox的工作原理和web上的CSS基本一致，当然也存在少许差异。首先是默认值不同：flexDirection的默认值是column而不是row，alignItems的默认值是stretch而不是flex-start，以及flex只能指定一个数字值。
*
* */

