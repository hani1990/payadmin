define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'pay/product/index',
                    add_url: 'pay/product/add',
                    edit_url: 'pay/product/edit',
                    del_url: 'pay/product/del',
                    multi_url: 'pay/product/multi',
                    table: 'pay_product',
                }
            });

            var table = $("#table");

            //在表格内容渲染完成后回调的事件
            table.on('post-body.bs.table', function (e, json) {
                $("tbody tr[data-index]", this).each(function () {
                    if (parseInt($("td:eq(1)", this).text()) <= 1) {
                        $("input[type=checkbox]", this).prop("disabled", true);
                    }
                });
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
                        {field: 'name', title: __('Name')},
                        {field: 'image', title: __('Image'), formatter: Table.api.formatter.image},
                        {field: 'price', sortable: true, title: __('Price'), operate: 'BETWEEN'},
                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            visible: false,
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'updatetime',
                            title: __('Updatetime'),
                            visible: false,
                            operate: 'RANGE',
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'status',
                            title: __('Status'),
                            searchList: {"hidden": __('hidden'), "normal": __('normal')},
                            formatter: Table.api.formatter.status
                        },
                        {
                            field: 'upload',
                            title: __('上传收款二维码'),
                            table: table,
                            formatter: function (value, row, index) {
                                var that = this;
                                if (row.id == 1) {
                                    that = $.extend({}, this);
                                    that.buttons = [
                                        {
                                            name: 'alipay',
                                            url: 'pay/qrcode/edit/ids/1/?product_id={ids}',
                                            text: '上传无固定金额支付宝二维码',
                                            extend: 'data-toggle="tooltip" data-placement="bottom"',
                                            title: '请保证上传的二维码是没有固定金额的',
                                            icon: 'fa fa-upload',
                                            classname: 'btn btn-xs btn-info btn-dialog'
                                        },
                                        {
                                            name: 'wechat',
                                            url: 'pay/qrcode/edit/ids/2/?product_id={ids}&id=2',
                                            text: '上传无固定金额微信二维码',
                                            extend: 'data-toggle="tooltip" data-placement="bottom"',
                                            title: '请保证上传的二维码是没有固定金额的',
                                            icon: 'fa fa-upload',
                                            classname: 'btn btn-xs btn-success btn-dialog'
                                        }
                                    ];
                                }
                                return Table.api.formatter.buttons.apply(that, [value, row, index]);
                            },
                            buttons: [
                                {
                                    name: 'upload',
                                    url: 'pay/qrcode/add?product_id={ids}',
                                    text: '上传收款二维码',
                                    extend: 'data-toggle="tooltip" data-placement="left"',
                                    title: '请上传固定金额收款二维码',
                                    icon: 'fa fa-upload',
                                    classname: 'btn btn-xs btn-primary btn-dialog'
                                },
                                {
                                    name: 'view',
                                    url: 'pay/qrcode/index?product_id={ids}',
                                    text: '查看二维码',
                                    icon: 'fa fa-eye',
                                    classname: 'btn btn-xs btn-warning btn-dialog'
                                }
                            ]
                        },
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            formatter: function (value, row, index) {
                                if (row.id != 1) {
                                    return Table.api.formatter.operate.apply(this, [value, row, index]);
                                } else {
                                    return '';
                                }
                            }
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
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"));
            }
        }
    };
    return Controller;
});