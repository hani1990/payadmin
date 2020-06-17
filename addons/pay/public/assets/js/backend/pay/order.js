define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'pay/order/index',
                    add_url: 'pay/order/add',
                    edit_url: 'pay/order/edit',
                    del_url: 'pay/order/del',
                    multi_url: 'pay/order/multi',
                    table: 'pay_order',
                }
            });

            var table = $("#table");

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', title: __('ID'), sortable: true},
                        {field: 'product_id', title: __('Product_id'), formatter: Table.api.formatter.search},
                        {
                            field: 'qrcode_id',
                            title: __('Qrcode_id'),
                            formatter: Table.api.formatter.search,
                            class: 'hidden-md',
                        },
                        {
                            field: 'price',
                            title: __('Price'),
                            operate: 'BETWEEN',
                            formatter: Table.api.formatter.search,
                            sortable: true
                        },
                        {
                            field: 'realprice',
                            title: __('Realprice'),
                            operate: 'BETWEEN',
                            formatter: Table.api.formatter.search,
                            sortable: true
                        },
                        {field: 'title', title: __('Title'), formatter: Table.api.formatter.search, class: 'hidden-md'},
                        {
                            field: 'out_order_id',
                            title: __('Out_order_id'),
                            formatter: Table.api.formatter.search,
                            sortable: true
                        },
                        {field: 'extend', title: __('Extend'), formatter: Table.api.formatter.search, sortable: true},
                        {field: 'type', title: __('Type'), formatter: Table.api.formatter.search},
                        {
                            field: 'paytime',
                            title: __('Paytime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime,
                            sortable: true,
                        },
                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime,
                            sortable: true,
                        },
                        {
                            field: 'updatetime',
                            title: __('Updatetime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime,
                            sortable: true,
                            visible: false,
                        },
                        {
                            field: 'status',
                            title: __('Status'),
                            searchList: {
                                "inprogress": __('inprogress'),
                                "expired": __('expired'),
                                "paid": __('paid'),
                                "settled": __('settled'),
                                "unsettled": __('unsettled')
                            },
                            formatter: Table.api.formatter.status,
                            sortable: true,
                            custom: {
                                inprogress: 'inprogress',
                                paid: 'teal',
                                expired: 'danger',
                                unsettled: 'warning',
                                settled: 'success'
                            }
                        },
                        {
                            field: 'action',
                            title: __('Operate'),
                            table: table,
                            operate: false,
                            formatter: Table.api.formatter.buttons,
                            buttons: [
                                {
                                    name: 'settled',
                                    text: '我已收款',
                                    url: 'pay/order/paid',
                                    classname: 'btn btn-primary btn-xs btn-ajax',
                                    extend: 'data-toggle="tooltip" data-placement="left"',
                                    title: '设为已收款,将同时发送通知',
                                    confirm: '确认已经收款?',
                                    success: function (data) {
                                        table.bootstrapTable('refresh');
                                    },
                                    hidden: function (row) {
                                        return row.status != 'inprogress' && row.status != 'expired';
                                    }
                                },
                                {
                                    name: 'notify',
                                    text: '重发通知',
                                    extend: 'data-toggle="tooltip" data-placement="left"',
                                    title: '补发成功后订单状态将变为已完成',
                                    url: 'pay/order/notify',
                                    classname: 'btn btn-info btn-xs btn-ajax',
                                    success: function (data) {
                                        table.bootstrapTable('refresh');
                                    },
                                    hidden: function (row) {
                                        return row.status == 'inprogress' || row.status == 'expired';
                                    }
                                },
                                {
                                    name: 'notifyinfo',
                                    text: '回调信息',
                                    extend: 'data-toggle="tooltip" data-placement="left"',
                                    title: '查看请求参数和返回结果',
                                    url: 'pay/order/notifyinfo',
                                    classname: 'btn btn-warning btn-xs btn-notifyinfo',
                                    hidden: function (row) {
                                        return row.status != 'unsettled';
                                    }
                                }
                            ]
                        },
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            formatter: Table.api.formatter.operate
                        }
                    ]
                ]
            });

            $(document).on("click", ".btn-notifyinfo", function () {
                var index = parseInt($(this).data("row-index"));
                var row = Table.api.getrowbyindex(table, index);
                Fast.api.ajax({
                    url: $(this).attr("href"),
                }, function (data, ret) {
                    Layer.open({
                        title: "回调信息",
                        area: ["800px", "600px"],
                        content: Template("notifytpl", data)
                    });
                    return false;
                });
                return false;
            });
            $(document).on("click", ".btn-preview", function () {
                var winname = window.open('', "_blank", '');
                winname.document.open('text/html', 'replace');
                winname.opener = null;
                winname.document.write($("#response").val());
                winname.document.close();
            });
            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        select: function () {

        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});