<%@ Page Title="" Language="C#" MasterPageFile="~/Admin/AdminMP.master" AutoEventWireup="true" CodeFile="create.aspx.cs" Inherits="Admin_gameChanging_create" %>

<asp:Content ID="Content1" ContentPlaceHolderID="CPH1" Runat="Server">
     <div class="content-wrapper">
        <!-- Content Header (Page header) -->
        <section class="content-header">
            <div class="row">

                <!-- edit form column -->
                <div class="col-md-9 personal-info">
                    <div class="alert alert-info alert-dismissable">
                        <a class="panel-close close" data-dismiss="alert">×</a>
                        سلام دوست من
                    </div>
                    <h3>افزودن بازی</h3>

                    <form class="form-horizontal" role="form">
                        <div class="form-group">
                            <label class="col-lg-3 control-label">نام بازی :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" placeholder="pes2019" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">اولویت بازی :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="number" placeholder="اولویت بازی برای نمایش چند است؟" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-md-3 control-label">نام کاربری فروشنده:</label>
                            <div class="col-md-8">
                                <input class="form-control" type="text" placeholder="reza78" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">قیمت پیشنهادی :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" placeholder="قیمتی معقول وارد کنید" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">دستگاه بازی :</label>
                            <div class="col-lg-8">
                                <div class="ui-select">
                                    <select class="form-control">
                                        <option>PC</option>
                                        <option>XBOX</option>
                                        <option>PS4</option>
                                        <option>PS5</option>
                                        <option>smart phone</option>
                                    </select>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">ژاندر بازی :</label>
                            <div class="col-lg-8">
                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="defaultUnchecked">
                                    <label class="custom-control-label" for="defaultUnchecked">جنایی</label>
                                </div>
                                <div class="col-lg-3  custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="deaultUnchecked">
                                    <label class="custom-control-label" for="deaultUnchecked">ترسناک</label>
                                </div>
                                <div class=" col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">اکشن</label>
                                </div>
                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">علمی تخیلی</label>
                                </div>
                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">استراتژیک</label>
                                </div>
                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">معمایی</label>
                                </div>
                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">دخترانه</label>
                                </div>
                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">کودکانه</label>
                                </div>

                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">مبارزه</label>
                                </div>

                                <div class="col-lg-3 custom-control custom-checkbox">
                                    <input type="checkbox" class="custom-control-input" id="dfaultUnchecked">
                                    <label class="custom-control-label" for="dfaultUnchecked">فکری</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">موجودیت :</label>
                            <div class="col-lg-8">
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="materialUnchecked" name="materialExampleRadios">
                                    <label class="form-check-label" for="materialUnchecked">موجود</label>
                                </div>
                                <div class="form-check">
                                    <input type="radio" class="form-check-input" id="materialUnchecked2" name="materialExampleRadios">
                                    <label class="form-check-label" for="materialUnchecked2">نا موجود</label>
                                </div>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">تعداد موجود در انبار :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">بارگذاری عکس کاور :</label>
                            <div class="col-lg-8">
                                <input type="file" id="pro_pic">
                                <label class="form-control" for="pro_pic" style="text-align: center; color: orangered; cursor: pointer; background: lightblue">بارگذاری</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">بارگذاری تریلر :</label>
                            <div class="col-lg-8">
                                <input type="file" id="pro_trailer">
                                <label class="form-control" for="pro_pic" style="text-align: center; color: orangered; cursor: pointer; background: lightblue">بارگذاری</label>
                            </div>
                        </div>
                        <div class="form-group">
                            <label class="col-lg-3 control-label">لینک دانلود :</label>
                            <div class="col-lg-8">
                                <input class="form-control" type="text" />
                            </div>
                        </div>
                        <div class="form-group">
                            <label for="exampleFormControlTextarea2">توضیحات :</label>
                            <textarea class="form-control rounded-0" id="exampleFormControlTextarea2" rows="3"></textarea>
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

