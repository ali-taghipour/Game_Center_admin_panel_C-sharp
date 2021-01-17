<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="Create.aspx.cs" Inherits="Admin_product_Create" %>

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
                        <label class="col-lg-3 control-label">اسم بازی :</label>
                        <div class="col-lg-8">
                            <input id="pname" class="form-control" type="text" runat="server" />
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label class="col-lg-3 control-label">سبک :</label>
                        <div class="col-lg-8">
                            <div class="ui-select">
                                <select id="genre" class="form-control" runat="server">
                                    <option>جنایی</option>
                                    <option>بکش بکش</option>
                                    <option>خاله بازی</option>
                                </select>
                            </div>
                        </div>
                    </div>--%>
                    <div class="form-group">
                        <label class="col-md-3 control-label">سال ساخت :</label>
                        <div class="col-md-8">
                            <input id="createYear" class="form-control" type="number" min="1998" runat="server" />
                        </div>
                    </div>
                    <%--<div class="form-group">
                        <label class="col-lg-3 control-label">دستگاه بازی پشتیبانی کننده :</label>
                        <div class="col-lg-8">
                            <div class="ui-select">
                                <select id="platform" class="form-control" runat="server">
                                    <option>PC</option>
                                    <option>XBOX</option>
                                    <option>PS4</option>
                                    <option>PS5</option>
                                    <option>smart phone</option>
                                </select>
                            </div>
                        </div>
                    </div>--%>
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
                            <input id="pnumber" class="form-control" type="number" min="0" runat="server"/>
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">قیمت :</label>
                        <div class="col-lg-8">
                            <input id="price" class="form-control" type="number" min="0" runat="server" />
                        </div>
                    </div>
                    <div class="form-group">
                        <label class="col-lg-3 control-label">بارگذاری عکس کاور :</label>
                        <div class="col-lg-8">
                            <input type="file" id="pro_pic" runat="server" multiple="multiple"/>
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
                            <input id="submit" type="submit" class="btn btn-primary" value="ثبت" onclick="getCat()" onserverclick="submit_click" runat="server" />
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
            url: "Create.aspx/GetAllCategory",
            data: {},
            contentType: "application/json; charset=utf-8",
            dataType: "json",
            success: function (data) {
                var category = data.d;
                if (category != null) {
                    $.each(category, function (e, el) {
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
                                    label = $("<label/>").addClass("custom-control-label");
                                    label.attr("for", "cat_" + el.id.toString());
                                    label.html(el.title);
                                    div.append(input).append(label);
                                    holder_subGroup.append(div);
                                });
                                form_group.append(holder_subGroup);
                            }
                            form_group.insertBefore("form > div:eq(3)");
                        }
                    });
                   
                }
            },
            error: function () {
            }
        });

        var category = [];

        $("form").on("click", ".form-group:not(:eq(-8)) > .col-lg-8 > div > input", function () {
            if ($(this).attr("type") == "checkbox") {
                if ($(this).prop("checked")) {
                    var catChild = { catId: $(this).data("id"), parentId: $(this).data("parentId")};
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
                url: "Create.aspx/getCategory",
                data: JSON.stringify({ "cat": category }),
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function () { },
                error: function () { }
            });
        }

    </script>
</asp:Content>

