//对象：String、Number、Array、Function
//内建对象：String、Date、Array

/*
//1、日期对象:
var date = new Date();
alert(date);

//2、访问字符串属性
var message = "helloworld";
var x = message.length;
alert(x)
//访问字符串方法
var message = "hello world!"
var x = message.toUpperCase();
alert(x)

//创建实例
var person = new Object();
person.firstName = "Bill";
person.lastName = "Gates";
person.age = 56;
person.eyeColor = "blue";
document.write(person.firstName + " is " + person.age + " years old.");

//替代语法,直接创建
person = {firstName:"Bill"};

*/


//使用对象构造器
function person(firstName,lastName,age,eyeColor) {
	this.firstName = firstName;
	this.lastName = lastName;
	this.age = age;
	this.eyeColor = eyeColor;
}
myBoss = new person('Bill','Gates',56,'blue');

var txt = '';
for (var x in myBoss){
	txt = txt + ' ' + x + ' ' + myBoss[x];
}
document.write(txt);








