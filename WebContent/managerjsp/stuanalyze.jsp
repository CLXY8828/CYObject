<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="utf-8">
		<title></title>
		<link rel="stylesheet" type="text/css" href="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/css/bootstrap.css"/>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/jquery.js" type="text/javascript" charset="utf-8"></script>
		<script src="<%=request.getContextPath() %>/bootstrap-3.3.7-dist/js/bootstrap.js" type="text/javascript" charset="utf-8"></script>
		<script type="text/javascript" src="<%=request.getContextPath()%>/js/echarts/echarts.js"></script>
		<style type="text/css">
			body{
				
			}
		</style>
	</head>
	<body>
		<div id="zhu" style="width: 65%;height:600px;float:left"></div>
	      
	      <script type="text/javascript">
	      //alert("页面已经加载了就开始触发了.....");
		     
	     // 基于准备好的dom，初始化echarts实例
	        
	        var app = {};

	        var chartDomZhu = document.getElementById('zhu');
	        var myChartZhu = echarts.init(chartDomZhu);
	        const colors = ['#5470C6', '#91CC75', '#EE6666'];
	     
	        // 指定图表的配置项和数据
	         var optionzhu = {
	        		 title: {
	        	         text: '学生就业信息概况',
	        	         subtext: '',
	        	         left: 'center'
	        	       },
	        
	        		  color: colors,
	        		  tooltip: {
	        		    trigger: 'axis',
	        		    axisPointer: {
	        		      type: 'cross'
	        		    }
	        		  },
	        		  grid: {
	        		    right: '20%'
	        		  },
	        		  
	        		  legend: {
	        		    data: ['Evaporation', 'Precipitation', 'Temperature']
	        		  },
	        		  xAxis: [
	        		    {
	        		      type: 'category',
	        		      axisTick: {
	        		        alignWithLabel: true
	        		      },
	        		      // prettier-ignore
	        		      data: [
	        		    	  '18级就业人数', '19级就业人数'
	        		    	  ]//年纪名字
	        		    }
	        		  ],
	        		  yAxis: [
	        		    {
	        		      type: 'value',
	        		      name: '就业人数',
	        		      position: 'right',
	        		      alignTicks: true,
	        		      axisLine: {
	        		        show: true,
	        		        lineStyle: {
	        		          color: colors[0]
	        		        }
	        		      },
	        		      axisLabel: {
	        		          formatter: '{value} 人'
	        		      }
	        		    },
	        		    {
	        		      type: 'value',
	        		      name: '未就业人数',
	        		      position: 'right',
	        		      alignTicks: true,
	        		      offset: 80,
	        		      axisLine: {
	        		        show: true,
	        		        lineStyle: {
	        		          color: colors[1]
	        		        }
	        		      },
	        		      axisLabel: {
	        		          formatter: '{value} 人'
	        		        }
	        		    },
	        		    {
	        		      type: 'value',
	        		      name: '就业率',
	        		      position: 'left',
	        		      alignTicks: true,
	        		      axisLine: {
	        		        show: true,
	        		        lineStyle: {
	        		          color: colors[2]
	        		        }
	        		      },
	        		      axisLabel: {
	        		          formatter: '{value} %'
	        		        }
	        		    }
	        		  ],
	        		  series: [
	        		    {
	        		      name: '就业人数',
	        		      type: 'bar',
	        		      data: [
	        		        846, 865
	        		      ]//年级得就业人数
	        		    },
	        		    {
	        		      name: '未就业人数',
	        		      type: 'bar',
	        		      yAxisIndex: 1,
	        		      data: [
	        		        32,48
	        		      ]//年级得未就业人数
	        		    },
	        		    {
	        		      name: '就业率',
	        		      type: 'line',
	        		      yAxisIndex: 2,
	        		      data: [96 ,97 ]//年级得就业率
	        		    }
	        		  ]
	        		};

	     
	     
	        // 使用刚指定的配置项和数据显示图表。
	        myChartZhu.setOption(optionzhu);
	      </script>
	     
	     <div id="bing" style="width:34%;height:600px;float:right"></div>
	     
	     <script type="text/javascript">
	     var chartDomBing = document.getElementById('bing');
	     var myChartBing = echarts.init(chartDomBing);
	     var optionbing;

	     optionbing = {
	       title: {
	         text: '就业地区分布',
	         subtext: '',
	         left: 'center'
	       },
	       tooltip: {
	         trigger: 'item'
	       },
	       legend: {
	         orient: 'vertical',
	         left: 'right'
	       },
	       series: [
	         {
	           name: 'Access From',
	           type: 'pie',
	           radius: '50%',
	           data: [
	             { value: 1048, name: '北京' },//查单位地址 模糊查询
	             { value: 735, name: '天津' },
	             { value: 580, name: '石家庄' },
	             { value: 484, name: '上海' },
	             { value: 300, name: '深圳' },
	             { value: 300, name: '广州' },
	             { value: 300, name: '其他' }
	           ],
	           emphasis: {
	             itemStyle: {
	               shadowBlur: 10,
	               shadowOffsetX: 0,
	               shadowColor: 'rgba(0, 0, 0, 0.5)'
	             }
	           }
	         }
	       ]
	     };
	     myChartBing.setOption(optionbing);
	     </script>
	</body>
</html>
