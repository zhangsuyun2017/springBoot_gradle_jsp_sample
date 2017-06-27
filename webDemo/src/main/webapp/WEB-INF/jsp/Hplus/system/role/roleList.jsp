<%--
  Created by IntelliJ IDEA.
  User: hxdn
  Date: 2017/3/14
  Time: 11:02
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8"%>
<html>
<head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">


    <title>H+ 后台主题UI框架 - 数据表格</title>
    <meta name="keywords" content="H+后台主题,后台bootstrap框架,会员中心主题,后台HTML,响应式后台">
    <meta name="description" content="H+是一个完全响应式，基于Bootstrap3最新版本开发的扁平化主题，她采用了主流的左右两栏式布局，使用了Html5+CSS3等现代技术">

    <link rel="shortcut icon" href="favicon.ico"> <link href="/Hplus/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/Hplus/css/font-awesome.css?v=4.4.0" rel="stylesheet">

    <!-- Data Tables -->
    <link href="/Hplus/css/plugins/dataTables/dataTables.bootstrap.css" rel="stylesheet">

    <link href="/Hplus/css/animate.css" rel="stylesheet">
    <link href="/Hplus/css/style.css?v=4.1.0" rel="stylesheet">
</head>
<body class="gray-bg">
<div class="wrapper wrapper-content animated fadeInRight">


    <div class="row">
        <div class="col-sm-12">
            <div class="ibox float-e-margins">
                <div class="ibox-title">
                    <label class="col-sm-1 control-label">搜索：</label>
                    <div class="col-sm-3">
                        <input type="text" id="searchValue" name="" class="form-control" placeholder="请输入搜索内容">
                    </div>
                    <button id="search" class="btn btn-w-m btn-primary" onclick="search()">搜索</button>

                </div>
                <div class="ibox-content">
                    <div class="">
                        <a onclick="fnClickAddRow();" href="javascript:void(0);" class="btn btn-primary ">添加行</a>

                    </div>

                    <table class="table table-striped table-bordered table-hover " id="editable">
                        <thead>
                        <tr>
                            <th>角色名</th>
                            <th>创建时间</th>
                            <th>最后更新时间</th>
                            <th>备注</th>
                            <th>是否可用</th>
                            <th>操作</th>
                        </tr>
                        </thead>
                        <tbody>
                       <%-- <tr class="gradeX">
                            <td>管理员</td>
                            <td>11</td>
                            <td>22</td>
                            <td class="center">是</td>
                            <td class="center">无</td>
                            <td class="center">操作</td>
                        </tr>
                        <tr class="gradeC">
                            <td>Trident</td>
                            <td>Internet Explorer 5.0
                            </td>
                            <td>Win 95+</td>
                            <td class="center">5</td>
                            <td class="center">C</td>
                            <td class="center">操作</td>
                        </tr>--%>

                        </tbody>
                        <tfoot>
                        </tfoot>
                    </table>

                </div>
            </div>
        </div>
    </div>
</div>

<!-- 全局js -->
<script src="/Hplus/js/jquery.min.js?v=2.1.4"></script>
<script src="/Hplus/js/bootstrap.min.js?v=3.3.6"></script>



<script src="/Hplus/js/plugins/jeditable/jquery.jeditable.js"></script>

<!-- Data Tables -->
<script src="/Hplus/js/plugins/dataTables/jquery.dataTables.js"></script>
<script src="/Hplus/js/plugins/dataTables/dataTables.bootstrap.js"></script>

<!-- 自定义js -->
<script src="/Hplus/js/content.js?v=1.0.0"></script>


<!-- Page-Level Scripts -->
<script>
    var table;
    $(document).ready(function () {
         table = $('#editable').dataTable({
            "processing": true,
            "serverSide": true,
            /* "searching": false,//屏蔽datatales的查询框*/
            "iDisplayLength": 10,//每页显示10条数据
            "aoColumns": [ //这个属性下的设置会应用到所有列，按顺序没有是空
                {"mData": 'roleName'}, //mData 表示发请求时候本列的列明，返回的数据中相同下标名字的数据会填充到这一列
                {"mData": 'createTime'},
                {"mData": 'lastUpdateTime'},
                {"mData": 'reMark'},
                {"sDefaultContent": ''},
                {"sDefaultContent": ''}, // sDefaultContent 如果这一列不需要填充数据用这个属性，值可以不写，起占位作用

            ],
            "aoColumnDefs": [//和aoColums类似，但他可以给指定列附近爱属性
                {"bSortable": false, "aTargets": [3]},  //这句话意思是第1,3,6,7,8,9列（从0开始算） 不能排序
                {"bSearchable": false, "aTargets": [0,1,2]}, //bSearchable 这个属性表示是否可以全局搜索，其实在服务器端分页中是没用的
            ],
            "ajax": {
                url:"/role/getRoles",
                "data": function ( d ) {
                    var searchValue = $('#searchValue').val();
                    //添加额外的参数传给服务器
                    d.searchValue = searchValue;
                }
            }

        });

       /* /!* Init DataTables *!/
        var oTable = $('#editable').dataTable();

        /!* Apply the jEditable handlers to the table *!/
        oTable.$('td').editable('../example_ajax.php', {
            "callback": function (sValue, y) {
                var aPos = oTable.fnGetPosition(this);
                oTable.fnUpdate(sValue, aPos[0], aPos[1]);
            },
            "submitdata": function (value, settings) {
                return {
                    "row_id": this.parentNode.getAttribute('id'),
                    "column": oTable.fnGetPosition(this)[2]
                };
            },

            "width": "90%",
            "height": "100%"
        });*/


    });

    function search(){
        $("#editable").DataTable().ajax.reload(null,false);
    }

    function fnClickAddRow() {
        $('#editable').dataTable().fnAddData([
            "Custom row",
            "New row",
            "New row",
            "New row",
            "New row",
            "New row"]);

    }
</script>



</body>
</html>
