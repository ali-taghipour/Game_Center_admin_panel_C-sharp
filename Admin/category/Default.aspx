<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_category_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">

            <h1>دسته بندی</h1>
            <div class="row">
                <!-- left column -->
                <div class="col-md-1">
                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        سلام دوست من
                    </div>
                    <h3>اطلاعات مورد نیاز</h3>

                    <form class="form-horizontal" role="form">

                        <section class="main_artc">
                            <div class="error_div" id="ErrorDiv" runat="server"></div>
                            <fieldset name="EditCategory">
                                <div class="text-warning text-center">
                                    - برای افزودن زیر دسته، ابتدا بر روی والد و سپس بر روی دکمه افزودن کلیک کنید.
                <br />
                                    - برای ویرایش دسته بندی، ابتدا بر روی دسته بندی مورد نظر و سپس  بر بروی دکمه ویرایش کلیک کنید.
                <br />
                                    - برای حذف دسته بندی، ابتدا بر روی دسته بندی مورد نظر و سپس بر روی دکمه حذف کلیک کنید.
                                </div>


                                <br />
                                <br />


                                <div>
                                    <div class="text-center">
                                        <button type="button" class="btn btn-success" onclick="StartAddCategory()">افزودن</button>
                                        <button type="button" class="btn btn-info" onclick="StartUpdateCategory()">ویرایش</button>
                                        <button type="button" class="btn btn-danger" onclick="DeleteCategory()">حذف</button>
                                    </div>
                                    <br />
                                    <br />

                                    <ul class="category_menu" id="menu">
                                        <%--<li>
                        <a data-id="1" data-flag="False" data-type="Group">آیسی </a>
                        <ul>
                            <li><a data-id="1" data-flag="True">آیسی سامسونگ</a></li>
                            <li><a data-id="2" data-flag="False">آیسی هوآوی</a></li>
                            <li><a data-id="3" data-flag="True">آیسی سونی</a></li>
                        </ul>
                        <span>+</span> 

                    </li>
                    
                    <li><a data-id="3" data-flag="False">موبایل</a></li> --%>
                                    </ul>
                                </div>


                                <br />
                                <br />

                                <div id="toggle_slide" class="toggle-slide">
                                    <div class="text-center form-title">
                                    </div>

                                    <div class="form-item">
                                        <input type="text" id="CatTitle" class="CatTitle" />
                                        <span><span>*</span> عنوان گروه :</span>

                                    </div>

                                    <div class="form-item">
                                        <input type="radio" name="IsEnabled" id="Enabled" class="Enabled" value="true" checked />
                                        <label for="Enabled">نمایش </label>

                                        <input type="radio" name="IsEnabled" id="Disabled" class="Disabled" value="false" />
                                        <label for="Disabled">عدم نمایش</label>

                                        <span><span>*</span> نمایش گروه در سایت :</span>

                                    </div>

                                     <div class="form-item">
                                        <input type="radio" name="manyChoice" id="manyChoice" class="Enabled" value="true" checked />
                                        <label for="manyChoice">دارد</label>

                                        <input type="radio" name="manyChoice" id="oneChoice" class="Disabled" value="false" />
                                        <label for="oneChoice">ندارد</label>

                                        <span><span>*</span> قابلیت چند انتخاب :</span>

                                    </div>

                                    <input type="hidden" class="CategoryId" id="CategoryId" />
                                    <input type="hidden" class="ParentId" id="ParentId" />

                                    <footer class="btn_holder">
                                        <div class="edit_btn">
                                            <input type="button" value="ذخیره" onclick="AddOrUpdateCategory()" />
                                        </div>

                                    </footer>

                                </div>
                                <br />
                                <br />
                            </fieldset>


                        </section>

                    </form>
                </div>
        </section>
    </div>

</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="CPH2" runat="server">
    <script>
        loadingCats();

        $(document).on("click", ".category_menu li > span", function () {

            if (!$(this).parent("li").hasClass("open_menu")) {

                $(this).parent("li").children("ul").slideDown(600);
                $(this).parent("li").addClass("open_menu");
                $(this).html("-");
            }
            else {
                $(this).parent("li").children("ul").slideUp(300);
                $(this).parent("li").removeClass("open_menu");
                $(this).html("+");

            }

        })

        $(document).on("click", ".cat_close", function () {
            $(".cat_overlay").css({ top: "-100%" });
        })
        $(document).on("click", ".category_select", function () {
            $(".cat_overlay").css({ top: "0" });
        })

        $(document).on("click", ".category_menu > li a", function () {

            if ($(this).data("id") == null)
                return;

            cat_id = $(this).data("id");
            cat_name = $(this).html();

            $(".cat_value").val(cat_id);
            $(".category_select > span").html(cat_name);
            $(".category_select").addClass("is_select");

            $(".cat_overlay").css({ top: "-100%" });
        })

        $("#menu").on("click", "li > a", function () {
            $("#toggle_slide").addClass("toggle-slide");
            if (!($(this).hasClass("select"))) {
                $(this).parents("ul").find("a").removeClass();
                $(this).addClass("select");
                return;
            }
            else {
                $("#CategoryId").val("");
                $("#ParentId").val("");
            }
            $(this).removeClass();
        });

        function DeleteCategory() {
            if ($("#menu").find("a").hasClass("select")) {
                catId = $("#menu").find("a.select").data("id");
                swal({
                    title: "آیا از انجام عملیات اطمینان دارید؟",
                    text: "!شما دیگر نمی توانید دسته حذف شده را برگردانید",
                    type: "warning",
                    showCancelButton: true,
                    cancelButtonText: "خیر",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "!بله ، پاک شود",
                    closeOnConfirm: false
                }, function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "post",
                            url: "Default.aspx/DeleteCatWithChildren",
                            data: '{"catId":' + catId + '}',
                            contentType: "application/json; charset=utf-8",
                            success: function (data) {
                                if (data.d) {
                                    swal({
                                        title: "!محصول حذف شد",
                                        type: "success",
                                        confirmButtonColor: "#DD6B52",
                                        confirmButtonText: "باشه"
                                    }, function (isConfirm) {
                                        if (isConfirm) {
                                            $("#menu").children().remove();
                                            loadingCats();
                                        }
                                    });

                                }
                                else {
                                    swal({
                                        title: "!خطای عملیات",
                                        text: "دسته مورد نظر حذف نشد",
                                        type: "error"
                                    });
                                }
                            },
                            error: function () {
                                swal({
                                    title: "!خطای عملیات",
                                    text: "دسته مورد نظر حذف نشد",
                                    type: "error"
                                });
                            }
                        });
                    }
                });
            }
        }

        function StartAddCategory() {
            $("#CategoryId").val("");
            $("#CatTitle").val("");
            $("#toggle_slide").removeClass();
            if ($("#menu").find("a").hasClass("select")) {
                $("#toggle_slide > .text-center.form-title").html("اضافه کردن زیرگروه برای گروه انتخاب شده");
                parentId = $("#menu").find("a.select").data("id");
                $("#ParentId").val(parentId);
            }
            else {
                $("#toggle_slide > .text-center.form-title").html("اضافه کردن سرگروه");
            }
        }

        function StartUpdateCategory() {
            $("#ParentId").val("");
            if ($("#menu").find("a").hasClass("select")) {
                $("#toggle_slide").removeClass();
                $("#CatTitle").val($("#menu").find("a.select").html());
                if ($("#menu").find("a.select").data("flag")) {
                    $("#Enabled").prop("checked", true);
                }
                else {
                    $("#Disabled").prop("checked", true);
                }
                if ($("#menu").find("a.select").data("manyChoice")) {
                    $("#manyChoice").prop("checked", true);
                }
                else {
                    $("#oneChoice").prop("checked", true);
                }
                $("#toggle_slide > .text-center.form-title").html("آپدیت کردن دسته مورد نظر");
                categoryId = $("#menu").find("a.select").data("id");
                $("#CategoryId").val(categoryId);
            }
        }

        // loading all category
        function loadingCats() {
            $.ajax({
                type: "post",
                url: "Default.aspx/getAllCats",
                data: {},
                contentType: "application/json; charset=utf-8",
                dataType: "json",
                success: function (data) {
                    view(data.d);
                },
                error: function () {
                }
            });
        }

        function view(data) {
            if (data == null) {
                var li = $("<li>").html("دسته ای موجود نیست!");
                $("#menu").append(li);
                return;
            }
            if (data.length > 0) {
                $.each(data, function (e, el) {
                    if (el.parentID == 0) {
                        $("#menu").append(creatingElement(el));
                    }
                });
            }
        }

        function creatingElement(element) {
            var li = $("<li/>");
            var a = $("<a/>");
            a.html(element.title);
            a.data("id", element.id);
            a.data("flag", element.status);
            a.data("manyChoice", element.manyChoice);
            li.append(a);
            if (element.childs != null && element.childs.length > 0) {
                var span = $("<span/>").html("+");
                li.append(span);
                var ul = $("<ul/>");
                $.each(element.childs, function (e, el) {
                    ul.append(creatingElement(el));
                });
                li.append(ul);
            }

            return li;
        }

        function AddOrUpdateCategory() {
            title = $("#CatTitle").val();
            status = $("#Enabled").is(":checked");
            manyChoice = $("#manyChoice").is(":checked");
            if ($("#CategoryId").val() == "" && $("#ParentId").val() == "") {
                swal({
                    title: "آیا از ایجاد دسته اطمینان دارید؟",
                    text: "!تغییرات ایجاد شده برگشت پذیر نیستند",
                    type: "warning",
                    showCancelButton: true,
                    cancelButtonText: "خیر",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "!بله ، ایجاد شود",
                    closeOnConfirm: false
                }, function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "post",
                            url: "Default.aspx/CreateTarget",
                            data: JSON.stringify({ "name": title, "status": status, "manyChoice": manyChoice}),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                var newCategory = data.d;
                                if (newCategory.title == title) {
                                    swal({
                                        title: "!دسته جدید ثبت شد",
                                        type: "success",
                                        confirmButtonColor: "#DD6B52",
                                        confirmButtonText: "باشه"
                                    }, function (isConfirm) {
                                        if (isConfirm) {
                                            $("#menu").children().remove();
                                            $("#toggle_slide").addClass("toggle-slide");
                                            loadingCats();
                                        }
                                    });
                                }
                                else {
                                    swal({
                                        title: "!خطای عملیات",
                                        text: "دسته جدیدی ثبت نشد",
                                        type: "error"
                                    });
                                }
                            },
                            error: function () {
                                swal({
                                    title: "!خطای عملیات",
                                    text: "دسته جدید ثبت نشد",
                                    type: "error"
                                });
                            }
                        });
                    }
                });
            }
            else if ($("#CategoryId").val() != "" && $("#ParentId").val() == "") {
                swal({
                    title: "آیا از بروزرسانی این دسته اطمینان دارید؟",
                    text: "!تغییرات ایجاد شده برگشت پذیر نیستند",
                    type: "warning",
                    showCancelButton: true,
                    cancelButtonText: "خیر",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "!بله ، انجام شود",
                    closeOnConfirm: false
                }, function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "post",
                            url: "Default.aspx/Update",
                            data: JSON.stringify({ "name": title, "status": status, "manyChoice": manyChoice, "catId": $("#CategoryId").val() }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                if (data.d) {
                                    swal({
                                        title: "!دسته مورد نظر بروزرسانی شد",
                                        type: "success",
                                        confirmButtonColor: "#DD6B52",
                                        confirmButtonText: "باشه"
                                    }, function (isConfirm) {
                                        if (isConfirm) {
                                            $("#menu").children().remove();
                                            $("#toggle_slide").addClass("toggle-slide");
                                            loadingCats();
                                        }
                                    });
                                }
                                else {
                                    swal({
                                        title: "!خطای عملیات",
                                        text: "دسته مورد نظر بروزرسانی نشد",
                                        type: "error"
                                    });
                                }
                            },
                            error: function () {
                                swal({
                                    title: "!خطای عملیات",
                                    text: "دسته مورد نظر بروزرسانی نشد",
                                    type: "error"
                                });
                            }
                        });
                    }
                });
            }
            else if ($("#CategoryId").val() == "" && $("#ParentId").val() != "") {
                swal({
                    title: "آیا از ایجاد دسته اطمینان دارید؟",
                    text: "!تغییرات ایجاد شده برگشت پذیر نیستند",
                    type: "warning",
                    showCancelButton: true,
                    cancelButtonText: "خیر",
                    confirmButtonColor: "#DD6B55",
                    confirmButtonText: "!بله ، ایجاد شود",
                    closeOnConfirm: false
                }, function (isConfirm) {
                    if (isConfirm) {
                        $.ajax({
                            type: "post",
                            url: "Default.aspx/CreateSubGroup",
                            data: JSON.stringify({ "name": title, "status": status, "manyChoice": manyChoice, "parentId": $("#ParentId").val() }),
                            contentType: "application/json; charset=utf-8",
                            dataType: "json",
                            success: function (data) {
                                var newCategory = data.d;
                                if (newCategory.title == title) {
                                    swal({
                                        title: "!دسته جدید ثبت شد",
                                        type: "success",
                                        confirmButtonColor: "#DD6B52",
                                        confirmButtonText: "باشه"
                                    }, function (isConfirm) {
                                        if (isConfirm) {
                                            $("#menu").children().remove();
                                            $("#toggle_slide").addClass("toggle-slide");
                                            loadingCats();
                                        }
                                    });
                                }
                                else {
                                    swal({
                                        title: "!خطای عملیات",
                                        text: "دسته جدیدی ثبت نشد",
                                        type: "error"
                                    });
                                }
                            },
                            error: function () {
                                swal({
                                    title: "!خطای عملیات",
                                    text: "دسته جدید ثبت نشد",
                                    type: "error"
                                });
                            }
                        });
                    }
                });
            }
        }
    </script>
</asp:Content>



