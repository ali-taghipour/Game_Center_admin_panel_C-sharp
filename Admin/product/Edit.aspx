<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="Edit.aspx.cs" Inherits="Admin_product_Edit" %>

<asp:Content ID="Content2" ContentPlaceHolderID="CPH1" runat="Server">
    <!-- Content Header (Page header) -->
    <section class="content-header">

        <h1>محصولات</h1>
        <div class="row">

            <!-- edit form column -->
            <div class="col-md-9 personal-info">
                <div id="error" class="alert alert-info alert-dismissable" runat="server">
                    <a class="panel-close close" data-dismiss="alert">×</a>
                    سلام دوست من
                </div>

                <h3>افزودن محصول</h3>

                <form runat="server" class="form-horizontal" role="form">
                    <div class="form-group">
                        <div id="Big_image" class="text-center">
                            <%--<img src="../../images/addImage.png" class="img-thumbnail" alt="Cinque Terre" />--%>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">اسم بازی :</label>
                        <div class="col-lg-8">
                            <input id="pname" class="form-control" type="text" placeholder="زولا" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-md-3 control-label">سال ساخت :</label>
                        <div class="col-md-8">
                            <input id="createYear" class="form-control" type="number" placeholder="2019" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">موجودیت :</label>
                        <div class="col-lg-8">
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="exist" name="r" runat="server" />
                                <label class="form-check-label" for="CPH1_exist">موجود</label>
                            </div>
                            <div class="form-check">
                                <input type="radio" class="form-check-input" id="materialUnchecked2" name="ctl00$CPH1$r">
                                <label class="form-check-label" for="materialUnchecked2">نا موجود</label>
                            </div>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">تعداد موجود در انبار :</label>
                        <div class="col-lg-8">
                            <input id="pnumber" class="form-control" type="number" min="0" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">قیمت :</label>
                        <div class="col-lg-8">
                            <input id="price" class="form-control" type="number" min="0" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">بارگذاری عکس اضافه کاور :</label>
                        <div class="col-lg-8">
                            <input type="file" id="pro_pic" runat="server" multiple="multiple" />
                            <label class="form-control" for="CPH1_pro_pic" style="text-align: center; color: orangered; cursor: pointer; background: lightblue">بارگذاری</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">بارگذاری تریلر :</label>
                        <div class="col-lg-8">
                            <input type="file" id="pro_trailer" runat="server">
                            <label class="form-control" for="CPH1_pro_trailer" style="text-align: center; color: orangered; cursor: pointer; background: lightblue">بارگذاری</label>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">لینک دانلود :</label>
                        <div class="col-lg-8">
                            <input id="plink" class="form-control" type="text" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="exampleFormControlTextarea2">توضیحات :</label>
                        <textarea class="form-control rounded-0" id="description" rows="3" runat="server"></textarea>
                    </div>
                    <%-- <div class="form-group">
                            <div class="g-recaptcha" data-sitekey="6Lddd5MUAAAAALbqtymbkPTP1xnYF5ClczlUWM9i" data-callback="verifyRecaptchaCallback" data-expired-callback="expiredRecaptchaCallback"></div>
                        </div>--%>

                    <div class="form-group">
                        <label class="col-md-3 control-label"></label>
                        <div class="col-md-8">
                            <input id="submit" type="submit" class="btn btn-primary" value="ثبت بروزرسانی" onclick="getCat()" onserverclick="submit_click" runat="server" />
                            <span></span>
                            <input type="reset" class="btn btn-default" value="لغو" />
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </section>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CPH2" runat="Server">
    <script src="../../bower_components/ckeditor/ckeditor.js"></script>
    <script>
        $(function () {
            CKEDITOR.replace("CPH1_description");
        })
    </script>
    <script>
        function previewImage(input) {
            if (input.files) {
                $("#CPH1_pro_pic").parents("div").children("img").remove();
                $("#CPH1_pro_pic").parents("div").children("span").remove();
                for (var i = 0; i < input.files.length; i++) {
                    var reader = new FileReader();
                    reader.onload = function (e) {
                        $("#CPH1_pro_pic").after('<img src="' + e.target.result + '"' + 'style="width:100px;margin-bottom:4px;margin-right:3px"' + '/>');
                    }
                    reader.readAsDataURL(input.files[i]);
                }
                $("#CPH1_pro_pic").after('<span onclick="delete_img()" style="color:red;border:1px solid #555;border-radius:20px;margin-right:5px;cursor:pointer">');
                $("#CPH1_pro_pic").parents("div").children("span").html("X");
            }
        }
        $("#CPH1_pro_pic").change(function () {
            previewImage(this);
        });

        function delete_img() {
            $("#CPH1_pro_pic").value = "";
            $("#CPH1_pro_pic").parents("div").children("img").remove();
            $("#CPH1_pro_pic").parents("div").children("span").remove();
        }
    </script>

    <script>
        $.ajax({
            type: "post",
            url: "Edit.aspx/pictureslargepathsrc",
            data: {},
            dataType: "json",
            contentType: "application/json; charset=utf-8",
            success: function (data) {
                var list = data.d;
                if (list != null) {
                    for (var i = 0; i < list.length; i++) {
                        div = $('<div style="margin-bottom:5px">');
                        im = $('<img class="img- thumbnail" alt="Cinque Terre">').attr("src", "../../" + list[i].largePath);
                        makeMain = $('<span style="border:1px solid #ddd;border-radius:5px;background:green;cursor:pointer">')
                        if (list[i].isMain) {
                            makeMain.html("اصلی نباشد؟");
                        }
                        else {
                            makeMain.html("اصلی شود؟");
                        }
                        del = $('<span style="border:1px solid #ddd;border-radius:5px;background:red;margin-right:5px;cursor:pointer">')
                        del.html("پاک شود؟");
                        div.append(im).append(makeMain).append(del);
                        $("#Big_image").append(div);
                    }
                }
            },
            error: function () { }
        });

        $("#Big_image").on("click", "div > span:nth-child(2n+1) ", function () {
            largePath = $(this).parents("div").children("img").attr("src");
            largePath = largePath.substr(6, largePath.length);
            delPic = $(this).parent("div");
            swal({
                title: "آیا از انجام عملیات اطمینان دارید؟",
                text: "!شما دیگر نمی توانید تصویر حذف شده را برگردانید",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "خیر",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "!بله ، پاک شود",
                closeOnConfirm: false
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: "Edit.aspx/deletePicByLargePath",
                        data: JSON.stringify({ "largePath": largePath }),
                        contentType: "application/json",
                        dataType: "json",
                        type: "post",
                        success: function (data) {
                            if (data.d) {
                                swal({
                                    title: "!تصویر حذف شد",
                                    type: "success",
                                    confirmButtonColor: "#DD6B52",
                                    confirmButtonText: "باشه"
                                }, function (isConfirm) {
                                    if (isConfirm) {
                                        delPic.remove();
                                    }
                                });

                            }
                            else {
                                swal({
                                    title: "!خطای عملیات",
                                    text: "تصویر مورد نظر حذف نشد",
                                    type: "error"
                                });
                            }
                        },
                        error: function () {
                            swal({
                                title: "!خطای عملیات",
                                text: "تصویر مورد نظر حذف نشد",
                                type: "error"
                            });
                        }
                    });
                }
            });
        });

        $("#Big_image").on("click", "div > span:nth-child(2n)", function () {
            largePath = $(this).parents("div").children("img").attr("src");
            largePath = largePath.substr(6, largePath.length);
            title = $(this);
            if ($(this).html() == "اصلی شود؟") {
                isMain = true;
            }
            else {
                isMain = false;
            }
            swal({
                title: "آیا از انجام تغییرات اطمینان دارید؟",
                text: "!تغییرات ایجاد شده برگشت پذیر نیستند",
                type: "warning",
                showCancelButton: true,
                cancelButtonText: "خیر",
                confirmButtonColor: "#DD6B55",
                confirmButtonText: "!بله ، تغییر داده شود",
                closeOnConfirm: false
            }, function (isConfirm) {
                if (isConfirm) {
                    $.ajax({
                        url: "Edit.aspx/updatePicByLargePath",
                        data: JSON.stringify({ "largePath": largePath, "isMain": isMain }),
                        contentType: "application/json",
                        dataType: "json",
                        type: "post",
                        success: function (data) {
                            if (data.d) {
                                swal({
                                    title: "!تغییرات روی تصویر اعمال شد",
                                    type: "success",
                                    confirmButtonColor: "#DD6B52",
                                    confirmButtonText: "باشه"
                                }, function (isConfirm) {
                                    if (isConfirm) {
                                        $("#Big_image > div > span:nth-child(2n)").html("اصلی شود؟");
                                        if (isMain == true) {
                                            title.html("اصلی نباشد؟");
                                        }
                                        else {
                                            title.html("اصلی شود؟");
                                        }

                                    }
                                });

                            }
                            else {
                                swal({
                                    title: "!خطای عملیات",
                                    text: "تغییرات روی تصویر اعمال نشد",
                                    type: "error"
                                });
                            }
                        },
                        error: function () {
                            swal({
                                title: "!خطای عملیات",
                                text: "تغییرات روی تصویر اعمال نشد",
                                type: "error"
                            });
                        }
                    });
                }
            });
        });
    </script>

    <script>
        function loadCategory(){
            $.ajax({
                type: "post",
                url: "Edit.aspx/GetAllCategory",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    var categories = data.d;
                    if (categories != null) {
                        $.each(categories, function (e, el) {
                            if (el.parentID == 0) {
                                form_group = $("<div/>").addClass("form-group");
                                group_title = $('<label class="col-lg-3 control-label"/>');
                                group_title.html(el.title + " :");
                                form_group.attr("name", "el_" + el.id.toString());
                                form_group.append(group_title);
                                if (el.childs != null || el.childs.length != 0) {
                                    holder_subGroup = $("<div/>").addClass("col-lg-8");
                                    $.each(el.childs, function (e, el) {
                                        div = $('<div class="custom-control custom-checkbox"/>');
                                        input = $("<input/>").addClass("custom-control-input");
                                        if (el.manyChoice) {
                                            input.attr("type", "checkbox");
                                        }
                                        else {
                                            input.attr("type", "radio");
                                            input.attr("name", "name_" + el.parentID);
                                        }
                                        input.attr("id", "cat_" + el.id.toString());
                                        input.data("id", el.id);
                                        input.data("parentId", el.parentID);
                                        if (category != null) {
                                            $.each(category, function (cat, catChild) {
                                                if (catChild.catId == input.data("id")) {
                                                    input.prop("checked", true);
                                                    catChild.parentId = el.parentID;
                                                }
                                            });
                                        }
                                        label = $("<label/>").addClass("custom-control-label");
                                        label.attr("for", "cat_" + el.id.toString());
                                        label.html(el.title);
                                        div.append(input).append(label);
                                        holder_subGroup.append(div);
                                    });
                                    form_group.append(holder_subGroup);
                                }
                                form_group.insertBefore("form > div:eq(4)");
                            }
                        });
                    }
                },
                error: function () {
                }
            });
        }
        var category = [];
        $.ajax({
            type: "post",
            url: "Edit.aspx/proCatToChoose",
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var cat = data.d;
                if (cat != null) {
                    $.each(cat, function (e, el) {
                        var catChild = { catId: el.catId, parentId: 0 };
                        category.push(catChild);
                    });
                }
                loadCategory();
            },
            error: function () { }
        });

        $("form").on("click", ".form-group:not(:eq(-8)) > .col-lg-8 > div > input", function () {
            if ($(this).attr("type") == "checkbox") {
                if ($(this).prop("checked")) {
                    var catChild = { catId: $(this).data("id"), parentId: $(this).data("parentId") };
                    category.push(catChild);
                }
                else {
                    id = $(this).data("id");
                    $.each(category, function (e, el) {
                        if (el.catId == id) {
                            category.splice(category.indexOf(el), 1);
                        }
                    });
                }
            }
            else if ($(this).attr("type") == "radio") {
                parentId = $(this).data("parentId");
                $.each(category, function (e, el) {
                    if (el.parentId == parentId) {
                        category.splice(category.indexOf(el), 1);
                    }
                });
                var catChild = { catId: $(this).data("id"), parentId: $(this).data("parentId") };
                category.push(catChild);
            }
        });
    </script>

    <script>
         function getCat() {
             $.ajax({
                 type: "post",
                 url: "Edit.aspx/getCategory",
                 data: JSON.stringify({ "cat": category }),
                 contentType: "application/json; charset=utf-8",
                 dataType: "json",
                 success: function () { },
                 error: function () { }
             });
         }

    </script>
</asp:Content>

