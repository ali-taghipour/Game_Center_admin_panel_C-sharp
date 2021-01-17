<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_product_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" runat="Server">
    <!-- Main content -->
    <section class="content">
        <div class="row">
            <h1 id="hi" runat="server" style="margin-right: 10px;">لیست محصولات</h1>
            <div class="col-xs-12">

                <!-- /.box -->
                    <div class="box">
                        <!-- /.box-header -->
                        <div id="tableBox" runat="server" class="box-body">
                            <%--<table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th>عکس بازی</th>
                                        <th>اسم کاربر</th>
                                        <th>اسم بازی</th>
                                        <th>سبک بازی</th>
                                        <th>سال ساخت</th>
                                        <th class="edit">ویرایش و پاک کردن</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                        <img src="../../images/login/12232434343455.jpg" /></td>
                                        <td>رضوان زولا باز</td>
                                        <td>زولا</td>
                                        <td>بچه بازی</td>
                                        <td>2019</td>
                                        <td>
                                            <ul>
                                                <li class="del" style="list-style: none; float: right;cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
                                            </ul>
                                        </td>

                                    </tr>
                                     <tr>
                                        <td>
                                        <img src="../../images/login/12232434343455.jpg" /></td>
                                        <td>رضوان زولا باز</td>
                                        <td>خاله بازی</td>
                                        <td>بچه بازی</td>
                                        <td>2017</td>
                                        <td>
                                             <ul>
                                                <li class="del" style="list-style: none; float: right;cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
                                            </ul>
                                        </td>

                                    </tr>
                                     <tr>
                                        <td>
                                        <img src="../../images/login/12232434343455.jpg" /></td>
                                        <td>علی ملایی</td>
                                        <td>کرم بازی</td>
                                        <td>بچه بازی</td>
                                        <td>2016</td>
                                        <td>
                                             <ul>
                                                <li class="del" style="list-style: none; float: right;cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
                                            </ul>
                                        </td>

                                    </tr>
                                     <tr>
                                        <td>
                                        <img src="../../images/login/12232434343455.jpg" /></td>
                                        <td>علی ملایی</td>
                                        <td>سوسک بازی</td>
                                        <td>بچه بازی</td>
                                        <td>2015</td>
                                        <td>
                                             <ul>
                                                <li class="del" style="list-style: none; float: right;cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
                                            </ul>
                                        </td>

                                    </tr>
                                </tbody>
                                <tfoot>
                                    <tr>
                                        <th>عکس بازی</th>
                                        <th>اسم کاربر</th>
                                        <th>اسم بازی</th>
                                        <th>سبک بازی</th>
                                        <th>سال ساخت</th>
                                        <th>ویرایش و پاک کردن</th>
                                    </tr>
                                </tfoot>
                            </table>
                            --%>
                        </div>
                        <!-- /.box-body -->
                    </div>
                    <!-- /.box -->
            </div>
            <!-- /.col -->
        </div>
        <!-- /.row -->
    </section>
    <!-- /.content -->
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="CPH2" runat="server">
    <script>
        $("#CPH1_example1").on("click", "tbody > tr > td > ul > .del", function () {
            var productId = $(this).attr("rel");
            swal({
                title: "آیا از انجام عملیات اطمینان دارید؟",
                text: "!شما دیگر نمی توانید محصول حذف شده را برگردانید",
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
                        url: "Default.aspx/deleteProduct",
                        data: '{"productId":' + productId + '}',
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
                                        window.location.reload();
                                    }
                                });
                                
                            }
                            else {
                                swal({
                                    title: "!خطای عملیات",
                                    text: "محصول مورد نظر حذف نشد",
                                    type: "error"
                                    });
                            }
                        },
                        error: function () {
                            swal({
                                title: "!خطای عملیات",
                                text: "محصول مورد نظر حذف نشد",
                                type: "error"
                            });
                        }
                    });
                }
            });
        });
    </script>
</asp:Content>

