<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="Admin_sendedContentManagement_Default" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" Runat="Server">
     <div class="content-wrapper">
        <!-- Main content -->
        <section class="content">
            <div class="row">
                <h1 style="margin-right: 10px;">لیست محصولات</h1>
                <div class="col-xs-12">

                    <!-- /.box -->

                    <div class="box">
                        <!-- /.box-header -->
                        <div class="box-body">
                            <table id="example1" class="table table-bordered table-striped">
                                <thead>
                                    <tr>
                                        <th style="width: 8%;">عکس بازی</th>
                                        <th>اسم کاربر</th>
                                        <th>اسم بازی</th>
                                        <th style="width: 15%;">سبک بازی</th>
                                        <th style="width: 15%;">سال ساخت</th>
                                        <th id="noSorting">ویرایش و پاک کردن</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>
                                        <img src="../images/login/12232434343455.jpg" /></td>
                                        <td>رضوان زولا باز</td>
                                        <td>زولا</td>
                                        <td>بچه بازی</td>
                                        <td>2019</td>
                                        <td>
                                            <ul>
                                                <li class="del" style="list-style: none; float: right; margin-right: 60px; cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; margin-left: 50px; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
                                            </ul>
                                        </td>

                                    </tr>
                                     <tr>
                                        <td>
                                        <img src="../images/login/12232434343455.jpg" /></td>
                                        <td>رضوان زولا باز</td>
                                        <td>خاله بازی</td>
                                        <td>بچه بازی</td>
                                        <td>2017</td>
                                        <td>
                                            <ul>
                                                <li class="del" style="list-style: none; float: right; margin-right: 60px; cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; margin-left: 50px; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
                                            </ul>
                                        </td>

                                    </tr>
                                     <tr>
                                        <td>
                                        <img src="../images/login/12232434343455.jpg" /></td>
                                        <td>علی ملایی</td>
                                        <td>کرم بازی</td>
                                        <td>بچه بازی</td>
                                        <td>2016</td>
                                        <td>
                                            <ul>
                                                <li class="del" style="list-style: none; float: right; margin-right: 60px; cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; margin-left: 50px; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
                                            </ul>
                                        </td>

                                    </tr>
                                     <tr>
                                        <td>
                                        <img src="../images/login/12232434343455.jpg" /></td>
                                        <td>علی ملایی</td>
                                        <td>سوسک بازی</td>
                                        <td>بچه بازی</td>
                                        <td>2015</td>
                                        <td>
                                            <ul>
                                                <li class="del" style="list-style: none; float: right; margin-right: 60px; cursor: pointer"><i class="glyphicon glyphicon-scissors"></i></li>
                                                <li class="edit" style="list-style: none; margin-left: 50px; cursor: pointer"><i class="glyphicon glyphicon-remove"></i></li>
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
    </div>
</asp:Content>

