define(['jquery', 'bootstrap', 'backend', 'table', 'form'], function ($, undefined, Backend, Table, Form) {

    var Controller = {
        index: function () {
            // 初始化表格参数配置
            Table.api.init({
                extend: {
                    index_url: 'pay/qrcode/index',
                    add_url: 'pay/qrcode/add',
                    edit_url: 'pay/qrcode/edit',
                    del_url: 'pay/qrcode/del',
                    multi_url: 'pay/qrcode/multi',
                    table: 'pay_qrcode',
                }
            });

            var table = $("#table");

            //在表格内容渲染完成后回调的事件
            table.on('post-body.bs.table', function (e, json) {
                $("tbody tr[data-index]", this).each(function () {
                    if (parseInt($("td:eq(1)", this).text()) <= 2) {
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
                        {field: 'id', title: __('ID'), sortable: true},
                        {field: 'product_id', sortable: true, title: __('产品ID'), formatter: Table.api.formatter.search},
                        {
                            field: 'product.name',
                            title: __('产品名称'),
                            formatter: Table.api.formatter.search
                        },
                        {
                            field: 'type',
                            title: __('Type'),
                            formatter: Table.api.formatter.search,
                            searchList: {"alipay": __('alipay'), "wechat": __('wechat')}
                        },
                        {
                            field: 'image', title: __('Image'), formatter: function (value, row, index) {
                                var image = Fast.api.cdnurl(value);
                                return '<a href="' + image + '" title="" onclick="return false;" class="view-payimg" data-img="' + image + '"><img src="' + image + '" class="img-sm img-center"/></a>';
                            }
                        },
                        {field: 'realprice', sortable: true, title: __('Realprice'), operate: 'BETWEEN'},
                        {field: 'url', title: __('Url'), formatter: Table.api.formatter.url},
                        {
                            field: 'createtime',
                            title: __('Createtime'),
                            operate: 'RANGE', sortable: true,
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime
                        },
                        {
                            field: 'updatetime',
                            title: __('Updatetime'),
                            operate: 'RANGE', sortable: true,
                            addclass: 'datetimerange',
                            formatter: Table.api.formatter.datetime,
                            visible: false
                        },
                        {
                            field: 'status',
                            title: __('Status'),
                            formatter: Table.api.formatter.status,
                            searchList: {"hidden": __('hidden'), "normal": __('normal')}
                        },
                        {
                            field: 'operate',
                            title: __('Operate'),
                            table: table,
                            events: Table.api.events.operate,
                            formatter: function (value, row, index) {
                                var that = this;
                                if (row.id <= 2) {
                                    that = $.extend({}, this);
                                    that.table.data("operate-del", null);
                                }
                                return Table.api.formatter.operate.apply(that, [value, row, index]);
                            }
                        }
                    ]
                ]
            });

            // 为表格绑定事件
            Table.api.bindevent(table);

            // 查看二维码
            $('body').popover({
                selector: 'a.view-payimg',
                html: true,
                trigger: 'hover',
                placement: 'left',
                content: function () {
                    return '<img src="' + $(this).data('img') + '" width="320" />';
                }
            });
        },
        add: function () {
            Controller.api.bindevent();
            $(document).on("change", "#c-product_id", function () {
                if ($(this).val() != '' && parseInt($(this).val()) <= 1) {
                    $('#c-product_id').selectPageClear();
                    Toastr.error("自动匹配价格的商品请勿在此上传");
                }
            });
        },
        edit: function () {
            Controller.api.bindevent();
            $("#plupload-image").data("upload-success", function (data) {
                Fast.api.ajax({
                    url: "pay/qrcode/add",
                    data: {image: data.url}
                }, function (data) {
                    if (!$("#c-realprice").prop("readonly")) {
                        $("#c-url").val(data.url);
                        $("#c-realprice").val(data.realprice);
                    } else {
                        //如果为只读说明只能上传无固定金额二维码
                        if (data.realprice > 0) {
                            $("#c-url").val('');
                            Layer.alert("请勿在此上传固定金额收款二维码,请重新上传！");
                            return false;
                        } else {
                            $("#c-url").val(data.url);
                        }
                    }
                });
            });
        },
        api: {
            bindevent: function () {
                Form.api.bindevent($("form[role=form]"), function () {

                }, function () {
                }, function () {
                    if ($("#plupload-qrcode").size() > 0 && $("input[name^='qrcode']").size() == 0) {
                        Toastr.error("请至少上传一张价格二维码");
                        return false;
                    }
                });
                var index = 0;
                $("#plupload-qrcode").data("upload-success", function (data) {
                    Fast.api.ajax({
                        url: "pay/qrcode/add",
                        data: {image: data.url}
                    }, function (data) {
                        if (data.url == "") {
                            Toastr.error("你上传了一张未能正确识别二维码的图片");
                            return false;
                        }
                        data.index = index;
                        data.image = Fast.api.cdnurl(data.image);
                        var html = Template("qrcodetpl", data);
                        $("#p-qrcode").append(html);
                        index++;
                    });
                });
                $(document).on('click', '.btn-trash', function () {
                    $(this).closest("li").remove();
                });
            }
        }
    };
    return Controller;
});