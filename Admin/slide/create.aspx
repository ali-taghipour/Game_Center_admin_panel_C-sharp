<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="Admin_slide_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" Runat="Server">
     <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">

            <h1>افزودن اسلاید برای نمایش</h1>
            <div class="row">
                <!-- left column -->
                <div class="col-md-3">
                    <h3>عکس مورد نظر برای نمایش را اینجا آپلود کنید</h3>
                    <div class="text-center">
                        <img src="~//placehold.it/200" class="image " alt="news pic" />
                        <input id="pers_pic" type="file" />
                        <label for="pers_pic">
                            <h6>آپلود عکس</h6>
                        </label>
                    </div>

                </div>

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        سلام دوست من
                    </div>
                    <h3>اطلاعات مورد نیاز</h3>

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">عنوان اسلاید :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" placeholder="عنوان اسلایدی را که قصد نمایش دارید را وارد کنبد" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-md-3 control-label">اولویت اسلاید :</label>
                            <div class="col-md-8">
                                <input class="form-control" type="number" placeholder="اولویت اسلاید چند است؟" />
                            </div>
                        </div>






                        <div class="form-group">
                            <label class="col-lg-3 control-label">تاریخ شروع نمایش :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="datetime" placeholder="98/3/10" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">تاریخ پایان نمایش :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="datetime" placeholder="98/11/24" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">وضعیت نمایش :</label>
                            <div class="col-lg-8">
                                <div class="ui-select">
                                    <select class="form-control">
                                        <option>فعال</option>
                                        <option>غیر فعال</option>

                                    </select>
                                </div>
                            </div>
                        </div>

                          <div class="form-group">
                            <label class="col-lg-3 control-label">لینک جهت دانلود :</label>
                            <div class="col-lg-8">
                                <input type="reset" class="btn btn-adn" value="لینک دانلود مستقیم " />
                            </div>
                        </div>

                        <div class="form-group"  style="margin: 5%">
                            <label class="col-md-4 control-label"></label>
                            <div class="col-md-8" >
                                <input type="button" class="btn btn-primary" value="ثبت" />
                                <span></span>
                                <input type="reset" class="btn btn-default" value="لغو" />
                            </div>
                        </div>
                </div>

                </form>
            </div>
        </section>
    </div>

</asp:Content>

