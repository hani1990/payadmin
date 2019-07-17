define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'pay/missing/index',
                    add_url: 'pay/missing/add',
                    edit_url: 'pay/missing/edit',
                    del_url: 'pay/missing/del',
                    multi_url: 'pay/missing/multi',
                    table: 'pay_missing',
                }
            });

            var table = $("#table");

            //在表格内容渲染完成后回调的事件
            table.on('post-body.bs.table', function (e, json) {

            });

            // 初始化表格
            table.bootstrapTable({
                url: $.fn.bootstrapTable.defaults.extend.index_url,
                pk: 'id',
                sortName: 'id',
                columns: [
                    [
                        {checkbox: true},
                        {field: 'id', sortable: true, title: __('ID')},
                        {
                            field: 'type',
                            sortable: true,
                            title: __('Type'),
                            formatter: Table.api.formatter.search,
                            searchList: {wechat: __('Wechat'), alipay: __('Alipay')}
                        },
                        {
                            field: 'price',
                            sortable: true,
                            title: __('Price'),
                            formatter: Table.api.formatter.search,
                            operate: 'BETWEEN'
                        },
                        {
                            field: 'order_id',
                            sortable: true,
                            title: __('Order_id'),
                        },
                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'updatetime',
                            title: __('Updatetime'),
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'status',
                            title: __('Status'),
                            searchList: {
                                "settled": __('settled'),
                                "unsettled": __('unsettled')
                            },
                            formatter: Table.api.formatter.status,
                            sortable: true,
                            custom: {
                                unsettled: 'warning',
                                settled: 'success'
                            }
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

            // 为表格绑定事件
            Table.api.bindevent(table);
        },
        add: function () {
            Controller.api.bindevent();
        },
        edit: function () {
            Controller.api.bindevent();

            $(document).on("click", ".btn-select", function () {
                Fast.api.ajax("pay/missing/selectorder/ids/" + $(this).data("id"), function (data) {
                    var html = Template('ordertpl', data);
                    $("#orderlist").html(html);
                    return false;
                });
                return false;
            });
            $(document).on("click", ".btn-choose", function () {
                $("#c-order_id").val($(this).data("id"));
                $("#orderlist").html('');
                return false;
            });
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});