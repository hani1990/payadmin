$(function () {
    var uuid = function () {
        return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function (c) {
            var r = Math.random() * 16 | 0, v = c == 'x' ? r : (r & 0x3 | 0x8);
            return v.toString(16);
        });
    }
    var payuuid = localStorage.getItem("payuuid");
    if (!payuuid) {
        payuuid = uuid();
        localStorage.setItem("payuuid", payuuid);
    }
    $('.carousel').carousel({
        interval: 5000
    });
    $(".btn-experience").on("click", function () {
        location.href = $("#experience_url").val() + "?price=" + $("input[name=price]").val() + "&type=" + $(this).data("type") + "&uuid=" + payuuid;
    });

});