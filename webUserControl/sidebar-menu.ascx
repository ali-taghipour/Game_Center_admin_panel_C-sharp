<%@ Control Language="C#" AutoEventWireup="true" CodeFile="sidebar-menu.ascx.cs" Inherits="webUserControl_sidebar_menu" %>

<ul class="sidebar-menu" data-widget="tree">
    <li class="header">صفحات مرتبط</li>
    <li class="active treeview">
        <a runat="server" href="~/index.aspx">
            <i class="fa fa-dashboard"></i><span>داشبورد</span>
        </a>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-newspaper-o"></i><span>اخبار</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i>افزودن خبر</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>لیست اخبار</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>ویرایش خبر</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>ارسال خبر</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>لیست اخبار ارسالی</a></li>
        </ul>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-sliders "></i><span>نمایش محصولات</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a runat="server" href="~/Admin/slide/create.aspx"><i class="fa fa-circle-o"></i>افزودن نمایش</a></li>
            <li><a runat="server" href="~/Admin/slide/create.aspx"><i class="fa fa-circle-o"></i>همه نمایش ها</a></li>
            <li><a runat="server" href="~/Admin/slide/create.aspx"><i class="fa fa-circle-o"></i>ویرایش نمایش</a></li>
        </ul>

    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-product-hunt "></i><span>محصولات</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a runat="server" href="~/Admin/product/Create.aspx"><i class="fa fa-circle-o"></i>افزودن و ویرایش محصول</a></li>
            <li><a runat="server" href="~/Admin/product/Default.aspx"><i class="fa fa-circle-o"></i>لیست محصولات</a></li>
        </ul>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-users"></i><span>کاربران</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i>افزودن و ویرایش حساب کاربری</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>لیست کاربران</a></li>
        </ul>
    </li>
    <li>
        <a runat="server" href="~/profile.aspx">
            <i class="fa fa-user"></i><span>حساب کاربری</span>
        </a>
    </li>
    <li class="treeview">
        <a href="~/Admin/gameChanging/create.aspx">
            <i class="fa fa-exchange"></i><span>تعویض بازی</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a runat="server" href="~/Admin/gameChanging/create.aspx"><i class="fa fa-circle-o"></i>افزودن بازی</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>درخواست بازی</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>لیست بازی ها</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>تاریخچه</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>لیست فروشگاه ها</a></li>
        </ul>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-credit-card"></i><span>مدیریت پرداخت</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i>افزایش اعتبار</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>لیست پرداخت</a></li>
            <li>
                <a href="#">
                    <i class="fa fa-shopping-basket"></i><span>سبد خرید</span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-red" style="margin-left: 20px">پرداخت نشده</small>
                    </span>
                    <span class="pull-right-container">
                        <small class="label pull-right bg-blue">5</small>
                    </span>
                </a>
            </li>
        </ul>
    </li>
    <li>
        <a href="#">
            <i class="fa fa-money"></i><span>مدیریت درآمد</span>
        </a>
    </li>
    <li class="treeview">
        <a href="~/Admin/category/Default.aspx">
            <i class="fa fa-th-list"></i><span>دسته بندی</span>


            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a runat="server" href="~/Admin/category/Default.aspx"><i class="fa fa-circle-o"></i>افزودن دسته</a></li>
            <li><a href="~/Admin/category/Default.aspx"><i class="fa fa-circle-o"></i>دسته بندی ها</a></li>
        </ul>
    </li>
    <li>
        <a href="#">
            <i class="fa fa-calendar"></i><span>تقویم</span>

            <span class="pull-right-container">
                <small class="label pull-right bg-red">2</small>
                <small class="label pull-right bg-yellow">12</small>
            </span>
        </a>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-comments"></i><span>مدیریت نظرها</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a href="#"><i class="fa fa-circle-o"></i>لیست نظرات</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>ویرایش نظرات</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>مدیریت پسندها</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>نظرات تخصصی</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>امتیازدهی کاربران</a></li>
        </ul>
    </li>
    <li>
        <a runat="server" href="~/sendContent.aspx">
            <i class="fa fa-send"></i><span>ارسال محتوا</span>
        </a>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-archive"></i><span>مدیریت محتوای ارسالی</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a runat="server" href="~/Admin/sendedContentManagement/Default.aspx"><i class="fa fa-circle-o"></i>لیست محتوا</a></li>
            <li><a href="#"><i class="fa fa-circle-o"></i>ویرایش محتوا</a></li>
        </ul>
    </li>
    <li class="treeview-menu">
        <a href="#">
            <i class="fa fa-paperclip"></i><span>ثبت رکورد کاربر</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a runat="server" href="~/Admin/sendedContentManagement/Default.aspx"><i class="fa fa-circle-o"></i>افزودن و ویرایش محتوا</a></li>
            <li><a runat="server" href="~/Admin/sendedContentManagement/Default.aspx"><i class="fa fa-circle-o"></i>لیست محتوا</a></li>
        </ul>
    </li>
    <li class="treeview">
        <a href="#">
            <i class="fa fa-tv"></i><span>تبلیغات</span>

            <span class="pull-right-container">
                <i class="fa fa-angle-right pull-right"></i>
            </span>
        </a>
        <ul class="treeview-menu">
            <li><a runat="server" href="~/Admin/advertisementManagement/create.aspx"><i class="fa fa-circle-o"></i>افزودن و ویرایش تبلیغ</a></li>
            <li><a><i class="fa fa-circle-o"></i>لیست تبلیغات</a></li>
        </ul>
    </li>
    <li>
        <a runat="server" href="~/FAQS.aspx">
            <i class="fa fa-phone"></i><span>تماس با ما</span>
        </a>
    </li>
</ul>
