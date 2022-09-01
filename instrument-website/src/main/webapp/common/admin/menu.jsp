<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/common/taglib.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<div id="sidebar" class="sidebar                  responsive                    ace-save-state">
    <script type="text/javascript">
        try{ace.settings.loadState('sidebar')}catch(e){}
    </script>
    <div class="sidebar-shortcuts">
        <div class="sidebar-shortcuts-large">
            <button class="btn btn-success">
                <i class="ace-icon fa fa-signal"></i>
            </button>

            <button class="btn btn-info">
                <i class="ace-icon fa fa-pencil"></i>
            </button>

            <button class="btn btn-warning">
                <i class="ace-icon fa fa-users"></i>
            </button>

            <button class="btn btn-danger">
                <i class="ace-icon fa fa-cogs"></i>
            </button>
        </div>
        <div class="sidebar-shortcuts-mini">
            <span class="btn btn-success"></span>

            <span class="btn btn-info"></span>

            <span class="btn btn-warning"></span>

            <span class="btn btn-danger"></span>
        </div>
    </div>
    <ul class="nav nav-list">
        <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Quản lý
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                    <a href='<c:url value="/admin-product?type=list&page=1&maxPageItem=20&sortName=id&sortBy=desc"></c:url>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách sản phẩm
                    </a>
                    <b class="arrow"></b>
                    <a href='<c:url value="/admin-user?type=list&page=1&maxPageItem=5&sortName=id&sortBy=desc"></c:url>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách tài khoản
                    </a>
                    <b class="arrow"></b>
                    <a href='<c:url value="/admin-order?type=list&page=1&maxPageItem=5&sortName=id&sortBy=desc"></c:url>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách hóa đơn
                    </a>
                    <b class="arrow"></b>
                    <a href='<c:url value="/admin-comment?type=list&page=1&maxPageItem=5&sortName=id&sortBy=des"></c:url>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Danh sách bình luận
                    </a>
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-list">
        <li >
            <a href="#" class="dropdown-toggle">
                <i class="menu-icon fa fa-list"></i>
                <span class="menu-text"></span>
                Thống kê
                <b class="arrow fa fa-angle-down"></b>
            </a>
            <b class="arrow"></b>
            <ul class="submenu">
                <li>
                <c:set var="date" value="<%=new java.util.Date()%>" />
				<fmt:formatDate pattern="yyyy-MM-dd" type="date" value="${date}" var="now"/>
                    <a href='<c:url value="/admin-statistic?statisticDate=${now}"></c:url>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Doanh thu
                    </a>   	
                    <b class="arrow"></b>
                    <c:set var="month" value="<%=new java.util.Date()%>" />
					<fmt:formatDate pattern="yyyy-MM" type="date" value="${date}" var="now"/>
                    <a href='<c:url value="/admin-topseller?statisticDate=${now}"></c:url>'>
                        <i class="menu-icon fa fa-caret-right"></i>
                        Sản phẩm bán chạy
                    </a>   	
                    <b class="arrow"></b>
                </li>
            </ul>
        </li>
    </ul>
    <div class="sidebar-toggle sidebar-collapse">
        <i class="ace-icon fa fa-angle-double-left ace-save-state" data-icon1="ace-icon fa fa-angle-double-left" data-icon2="ace-icon fa fa-angle-double-right"></i>
    </div>
</div>