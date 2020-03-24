---
title: vue的使用
comments: true
mathjax: true
date: 2020-03-22 19:51:16
top:
false cover:
false password:
summary:
tags:
categories:
---
## Vue的使用

### vue介绍

​		Vue.js是一套构建用户界面的渐进式框架。与其他重量级框架不同的是，Vue 采用自底向上增量开发的设计。

### vue如何使用

​		vue在使用的时候，有一定的格式要求，以后慢慢记录，总的来说需要在标签中找到对应的id、class等，在script中进一步操作

​		示例：

```HTML
<div id="app">{{msg}}</div>
<script>
		//创建vue的对象
		var app = new Vue({
		//el:是挂载，就是找到对象
		//data:对象中变量对应的值
		el:"#app",
		data:{
				msg:"hello world"
			}
		})
	</script>
```

### 模板渲染的三种方式

​		模板渲染有三种方式，使用的时候在script中进行操作

- `<p>{{msg}}</p>`

- `<p v-text="msg"></p>`

- `<p v-html="msg"></p>`

  使用示例：

  ```html
  <div id="app">
  	<!-- 第一种渲染 -->
      <p>{{msg}}</p>
      <p>{{title}}</p>
      <!-- 第二种渲染 -->
      <!-- 标签里面的一个属性  v-text -->
      <p v-text="msg"></p>
      <p v-text="title"></p>
      <!-- 第三种渲染方式 -->
      <!-- v-html渲染的时候会解析字符串的标签（html） -->
      <p v-html="msg"></p>
      <p v-html="title"></p>
  </div>
  <script>
  		var app = new Vue({
  			//el:是挂载，就是找到对象
  			//data:对象中变量对应的值
  			el:"#app",
  			data:{
  				//key-value
  				msg:"hello, Vue",
  				title:"H<sub>2</sub>",
  			}
  		})
  ```

  

### if 语句的使用

​		使用if语句是在标签中添加`v-if`或者`v-show`属性，然后在script中修改`v-if`或者`v-show`对应值的状态，来判断是否执行：

- `<p v-if="isshow">{{title}}</p>`

- `<p v-show="isshow">{{title}}</p>`

  使用示例

  ```html
  <div id="app">
      <p v-if="isshow">{{title}}</p>
      <p v-show="isshow">{{title}}</p>
  </div>
  <script>
  		var app = new Vue({
  			el:"#app",
  			data:{
  				title:"H<sub>2</sub>",
  				isshow:true,
  			}
  		})
  </script>
  ```

  

### for循环语句的使用

​		在html文件中需要渲染多个字段时，可以传入一个列表或其他可迭代的数据，可以使用for循环遍历出数据，放入指定的位置。

​		使用方法：

- 在标签中加入`v-for="item in list"`属性

- 在script中书写方法，data数据中要包含`list:[text:'***']`键值对

  使用实例：

  ```html
  <div id="app">
      <li v-for="(item, index) in list">
          {{item.text}}
  	</li>
  </div>
  <script>
  		var app = new Vue({
  			el:"#app",
  			data:{
  				list:[
  					{text:"html"},
  					{text:"python"},
  					{text:"php"}
  				]
  			}
  		})
  </script>
  ```

  

### 事件的绑定

​		事件的绑定就是，给一个标签添加一个点击事件，或者实现一个功能，例如：当点击一个按钮时实现更换字体颜色或弹窗

​		使用方法（有两种写法）：

- `<p v-on:click="dian">点击</p>`

- `<p @click="dian">点击</p>`

  使用实例

  ```html
  <div id="app">
  	<p v-on:click="dian">点击试试看<p>
  </div>
  <script>
  	var app = new Vue({
  		el:'#app',
  		data:{},
  		methods:{
  				pingpang:function(){
  					alert("哟，来了，老弟")
  				}
  			}
  		})
  	</script>
  ```

  

### 属性的绑定

​	属性的绑定就是，一个输入框绑定一个变量，实现一个绑定传值，例如：当一个输入框输入内容时，绑定的变量时时变更

​		使用方法（有两种写法）：

- `<img v-bind:src="log"></img>`

- `<img :src="log"></img>`

  使用实例

  ```html
  <div id="app">
  			<p>{{log}}</p>
  			<!-- 第一种写法 -->
  			<!-- 属性的绑定 记着加v-bind -->
  			<img v-bind:src="log" style="width:90px"/>
  			<!-- 第二种写法 -->
  			<img :src="log" style="width:90px"/>
  </div>
  <script>
  		var app = new Vue({
  			el:"#app",
  			data:{
  				log:"https://cn.vuejs.org/images/logo.png",
  			}
  		})
  </script>
  ```

  

### 样式绑定

​	样式绑定就是显示的格式，如：颜色，大小，动画等等，当状态发生改变时，跟随改变

​	使用方法：用法和属性绑定用法一样

​	使用实例：

```html
<div id="app">
			<p :id="color">{{msg}}</p>
		</div>
<script>
		var app = new Vue({
			el:"#app",
			data:{
				msg:"喜欢粉色",
				color:"pink"
			}
		})
	</script>
```

### 双向数据的绑定

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title>双向事件的绑定</title>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	</head>
	<body>
		<div id="app">
			
			<p>{{msg}}</p>
			<p>
				<input type="text" v-model="msg"/>
			</p>
			<p>
				输入的内容:{{msg}}
			</p>
		</div>
	</body>
	<script>
		var app = new Vue({
			el:"#app",
			data:{
				msg:"hello,ergou"
			}
		})
	</script>
</html>

```

### 组件中重要的选项

```html
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<script src="https://cdn.jsdelivr.net/npm/vue/dist/vue.js"></script>
	</head>
	<body>
		<div id="app">
			<p>{{msg}}</p>
			<p>商品价格:￥{{price}}</p>
			<p>库存:{{stock}}</p>
			<p>
				<button @click="sub">-</button>
				<span>商品的数量:{{num}}</span>
				<button @click="add">+</button>
			</p>
			<p>总金额:{{sumprice}}</p>
			<p>优惠:{{showstr}}</p>
		</div>
	</body>
	<script>
		var app = new Vue({
			el:"#app",
			data:{
				msg:"以下是很好玩的东西",
				price:10,
				//库存
				stock:20,
				//商品的数量
				num:0,
			},
			methods:{
				sub:function(){
					//this就是当前的vue对象
					this.num--
				},
				add:function(){
					this.num++
				}
			},
			//计算属性
			computed:{
				sumprice:function(){
					return this.num * this.price
				},
				showstr:function(){
					if(this.sumprice >= 100){
						return "包邮"
					}else{
						return "不包邮"
					}
				}
				
			},
			//watch:也是vue对象的属性
			watch:{
				num:function(newvalue, oldvalue){
					if (newvalue < 0|| newvalue > 20) {
						console.log(newvalue)
						console.log(oldvalue)
						this.num = oldvalue
					}
				}
			}
			
		})
	</script>
</html>

```

nodejs安装步骤，请看下面的网址：

<https://blog.csdn.net/amaoagou_0124/article/details/80394930> 



## vue主要文件介绍及使用小例	

### 主要目录及文件作用

```
vue-cli目录解析
build:webpack相关的脚本，开发中仅偶尔用到，主要是预编译库
config：主要是配置文件，用于区分开发环境和线上环境的不同
node_modules:存放npm加载之后的所有的依赖包（重要）
src:更重要（等一会儿专门介绍src里面项）
static:静态文件（js, css,image）
index.htm：设置一些meta头信息（切换设备，pc，app）
package.json:node_modules资源部，启动，打包项目的管理（不用动，但是必须有） requirement.txt
```

### src文件夹下面的文件

```
assets:存放静态的资源
compontents:(相当重要，没有他就没有页面，)
routes:路由（重要）
app.vue:渲染整个工程的vue组件（重要）
main.js:是vue-cli工程的入口文件（重要）
```

### 主要文件详情及作用

#### main.js

```vue
// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import axios  from "axios"
import ElementUI from "element-ui"
import VueAxios from "vue-axios"
import "element-ui/lib/theme-chalk/index.css"
import "./global.css"

Vue.config.productionTip = false
// 加载第三方的东西比如咱们以后会用到   element-ui      vue-axios(ajax,vue封装的ajax) axios
/* eslint-disable no-new */
Vue.use(VueAxios, axios)
Vue.use(ElementUI)
new Vue({
  el: '#app',
  router,
  components: { App },
  template: '<App/>'
})

```

#### app.vue

```vue
<template>
  <div id="app">
    <!-- 四个按钮 -->
		
    <router-view/>
		<footer>
		<router-link class="home" active-class="homeactive" to="/home"> <dl><dt><span></span></dt><dd>首页</dd></dl></router-link>
		<router-link class="market" active-class="marketactive" to="/market"><dl><dt><span></span></dt><dd>闪送超市</dd></dl></router-link>
		<router-link class="cart" active-class="cartactive" to="/cart"><dl><dt><span></span></dt><dd>购物车</dd></dl></router-link>
		<router-link class="mine" active-class="mineactive" to="/mine"><dl><dt><span></span></dt><dd>我的</dd></dl></router-link>
		</footer>
  </div>
</template>

<script>
export default {
  name: 'App'
}
</script>

<style>
#app {
  font-family: 'Avenir', Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #ff0000;
  margin-top: 60px;
}

footer{
	position:fixed;
	display:flex;
	bottom:0;
	left:0;
	right:0;
	background-color:#fff;
	height:2.5rem;
	border-top:1px solid #F0F0F0;
	
	
	
}
footer dd {
	font-size:0.7rem;
}
footer a {
	display:block;
	flex:1;
	text-align:center;
	/* 浮动的效果 */
	overflow:hidden!important;
}
footer dl dt {
	height:0.98rem;
	padding-top:0.1rem;
}
footer dl span{
	display:inline-block;
	width:0.80rem;
	height:0.80rem;
}

footer .home span {
	background:url("./assets/home.png") no-repeat;
	background-size:0.80rem;
}
footer .market span {
	background:url("./assets/market.png") no-repeat;
	background-size:0.80rem;
}
footer .cart span {
	background:url("./assets/cart.png") no-repeat;
	background-size:0.80rem;
}
footer .mine span {
	background:url("./assets/mine.png") no-repeat;
	background-size:0.80rem;
}
footer .homeactive span {
	background:url("./assets/home1.png") no-repeat;
	background-size:0.80rem;
}
footer .marketactive span {
	background:url("./assets/market1.png") no-repeat;
	background-size:0.80rem;
}
footer .cartactive span {
	background:url("./assets/cart1.png") no-repeat;
	background-size:0.80rem;
}
footer .mineactive span {
	background:url("./assets/mine1.png") no-repeat;
	background-size:0.80rem;
}



</style>

```

#### index.js

```vue
import Vue from 'vue'
import Router from 'vue-router'
import HelloWorld from '@/components/HelloWorld'
import Home from "@/components/Home"
import Market from "@/components/Market"
import Cart from "@/components/Cart"
import Mine from "@/components/Mine"

Vue.use(Router)

export default new Router({
  routes: [
    // {
    //   path: '/',
    //   name: 'HelloWorld',
    //   component: HelloWorld,
    // },
		{
		  path: '/home',
		  name: 'Home',
		  component: Home,
		},
		{
		  path: '/market',
		  name: 'Market',
		  component: Market,
		},
		{
		  path: '/cart',
		  name: 'Cart',
		  component: Cart,
		},
		{
		  path: '/mine',
		  name: 'Mine',
		  component: Mine,
		},
		
  ]
})

```

#### mine.vue

```vue
<template>
	<div id="mine">

		<div class="fixed">
			<span>
				<img v-if="false" class="u_icon" src="111" alt="1212"/>
				<span v-else class="glyphicon glyphicon-user"></span>
			</span>
			<p v-if="token">{{user_info.u_username}}</p>
			<p v-else id="not_login" @click="jump('login')">未登录</p>
			
			<p>
				<span class="glyphicon glyphicon-fire"></span>
				<span>等级</span>
			</p>
			<div v-show="!token" id="regis" @click="jump('register')">注册</div>
			<p>
				<span class="glyphicon glyphicon-heart"></span>
				<span>商品收藏</span>
			</p>
		</div>
		
	</div>
</template>

<script>
	export default {
	  name: 'Mine',
	  methods:{
		  jump:function(page){
			  this.$router.push({path:"/"+page})
		  }
	  },
	  data () {
	    return {
	      msg: '这个是mine'
	    }
	  }
	}
</script>

<style>
	#mine {
		width:100%;
		height:100%;
		position:absolute;
		/* z-index:+10; */
		background:whitesmoke;
		padding-bottom:1.5rem;
		overflow:hidden;
		padding-top:calc(4rem - 60px);
		
	}
	.fixed {
		position:fixed;
		top:0;
		width:100%;
		height:7rem;
		background:pink;
		padding-top:0.5rem;
		text-align:left;
	}
	.fixed > span {
		display:block;
		width:2rem;
		height:2rem;
		float:left;
		margin:0 0.3rem 0;
		font-size:1.5rem;
		color:black;
		background:white;
		text-align:center;
		border-radius:50%;
		line-height:1.8rem;
		
	}
	.fixed > span > .u_icon {
		width:2rem;
		height:2rem;
		border-radius:50%;
	}
	.fixed p {
		margin-bottom:0.5rem;
		font-size:0.5rem;
		color:white;
	}
	.fixed p span:first-child{
		color:black;
	}
	.fixed p span:last-child{
		color:green;
	}
	#regis {
		position:absolute;
		right:0.3rem;
		top:1.3rem;
		color:white;
		font-size:1rem;
	}
	.fixed p:last-child {
		background:#f0e000;
		width:100%;
		position:absolute;
		text-align:center;
		bottom:0;
		margin-bottom:0;
		font-size:0.4rem;
		line-height:1.5rem;
		height:1.5rem;
	}
	.fixed p:last-child span {
		margin:0.2rem 0;
	}
	.fixed p:last-child span:first-child {
		color:red;
	}
	.fixed p:last-child span:last-child {
		color:white;
	
	}
</style>

```

#### index.html

```html
# 是全局的vue页面都要使用这个


引入bootstrap


<!DOCTYPE html>
<html>
  <head>
    <meta charset="utf-8">
    <!-- <meta name="viewport" content="width=device-width,initial-scale=1.0"> -->
		<meta name="viewport" content="width=device-width,initial-scale=1.0,minimum-scale=1,
		maximum-scale=1,user-scalabel=no">
    <title>axf-front</title>
		<link rel="stylesheet" type="text/css" href="static/css/bootstrap-theme.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/bootstrap-theme.min.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/swiper.min.css"/>
		<link rel="stylesheet" type="text/css" href="static/css/bootstrap.min.css"/>
		<script src="static/js/bootstrap.js" type="text/javascript" charset="UTF-8"></script>
		<script src="static/js/jquery.min.js" type="text/javascript" charset="UTF-8"></script>
		<script src="static/js/swiper.jquery.min.js" type="text/javascript" charset="UTF-8"></script>
  </head>
  <body>
    <div id="app"></div>
    <!-- built files will be auto injected -->
		<script>
			document.documentElement.style.fontSize= innerWidth/15 +"px"
		</script>
  </body>
</html>

```

#### register.vue

```vue
<template>
	<div>
		<header>
			<span class="glyphicon glyphicon-chevron-left" @click="back()"></span>
		</header>
		<div class="container">
			<div>
				<div class="form-group">
					<label for="user_input">用户名</label>
					<input  name="username"  class="form-control" type="text" id="username_input" placeholder="请输入用户名" v-model="userName"/>
					<span id="username_info"></span>
				</div>
				<div class="form-group">
					<label for="email_input">邮箱</label>
					<input  name="email" class="form-control" type="text" id="email_input" placeholder="请输入邮箱" v-model="email"/>
					
				</div>
				<div class="form-group">
					<label for="password_input">密码</label>
					<input  name="password"  class="form-control" type="password" id="password_input" placeholder="请输入密码" v-model="password"/>
				</div>
				<div class="form-group">
					<label for="password_confirm_input">确认密码</label>
					<input   type="password" class="form-control" id="password_confirm_input" placeholder="请输入确认密码" v-model="password2"/>
				</div>
				<button class="btn btn-success btn-block" @click="registe()">注册</button>
			</div>
		</div>
	</div>
</template>

<script>
	export default{
		name:"register",
		methods:{
			back:function(){
				this.$router.back()
			},
			registe:function(){
				const params = {
					u_username:this.userName,
					u_password:this.password,
					u_email:this.email,
					u_password2:this.password2,
				}
				this.axios.post("http://127.0.0.1:8000/api/user/user/register/", {
					...params
				}).then(response=>{
					
					console.log(response.data)
					if (response.data.code == 200){
						
						this.$router.push({path:"/login"})
						
						
					}
				});
			}
		}
	}
</script>

<style>
	header {
		height: 1.5rem;
		background: darkorange;
		margin-bottom: 0.3rem;
		padding-left: 15px;
		display:flex;
		align-items: center; 
			}
	.form-group {
		text-align:left;
	}
</style>

```


