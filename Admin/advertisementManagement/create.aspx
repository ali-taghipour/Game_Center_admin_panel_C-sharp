<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="Admin_advertisementManagement_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" Runat="Server">
     <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">

            <h1>مدیریت تبلیغات</h1>
            <div class="row">

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        سلام دوست من
                    </div>
                    <h3>افزودن و ویرایش تبلیغات</h3>

                    <form class="form-horizontal" role="form">
                       <div class="form-group">
                            <label class="col-lg-3 control-label">عنوان :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" placeholder="محتوای محصول" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">نام و خانوادگی :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" placeholder="تقی پور و رضوان" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">نام شرکت :</label>
                            <div class="col-md-8">
                                <input class="form-control" type="text" placeholder="نام معتبر باشد" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">ایمیل :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" placeholder="rezvan@gmail.com" />
                            </div>
                        </div>

                       <div class="form-group">
                            <label class="col-lg-3 control-label">شماره تماس :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="tel"  placeholder="1234" />
                            </div>
                        </div>

                        
                        <div class="form-group">
                            <label class="col-lg-3 control-label">تاریخ شروع :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="datetime"" placeholder="98/1/2" />
                            </div>
                        </div>

                        <div class="form-group">
                            <label class="col-lg-3 control-label">تاریخ پایان :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="datetime" placeholder="98/3/2" />
                            </div>
                        </div>
                        

                        
                        <div class="form-group">
                            <label for="exampleFormControlTextarea2">آدرس کامل :</label>
                            <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3"></textarea>
                        </div>

                        

                         <div class="form-group">
                            <label for="exampleFormControlTextarea2"> توضیحات مورد نیاز :</label>
                            <textarea class="form-control rounded-3" id="exampleFormControlTextarea2" rows="3"></textarea>
                        </div>
                </div>
                <div class="form-group">
                    <label class="col-md-3 control-label"></label>
                    <div class="col-md-8">
                        <input type="button" class="btn btn-primary" value="ثبت" />
                        <span></span>
                        <input type="reset" class="btn btn-default" value="لغو" />
                    </div>
                </div>
                </form>
            </div>
        </section>
    </div>

</asp:Content>

