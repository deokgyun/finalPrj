<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="sec"
           uri="http://www.springframework.org/security/tags" %>
<html>
<head>

    <meta charset="utf-8"/>
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">
    <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" id="bootstrap-style"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" id="app-style" rel="stylesheet"
          type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.min.css"
          rel="stylesheet" type="text/css">
    <link href="${pageContext.request.contextPath }/resources/assets/css/project_Css/project.css" rel="stylesheet"
          type="text/css"/>
    <link href="${pageContext.request.contextPath }/resources/assets/libs/dropzone/min/dropzone.min.css"
          rel="stylesheet" type="text/css"/>
    <meta name="_csrf" content="${_csrf.token }">
    <meta name="_csrf_header" content="${_csrf.headerName}">
    <style>
        html, .main-content {
            background-color: #FFFFFF;
        }

        .page-content {
            width: 90%;
        }

        .warning {
            width: 0;
            height: 0;
            border-style: solid;
            border-width: 0 100px 50px 100px;
            border-color: transparent transparent yellow transparent;
            position: relative;
        }

        .warning::after {
            content: "!";
            color: black;
            font-size: 40px;
            font-weight: bold;
            position: absolute;
            top: 15px;
            left: -5px;
        }

        .warning-text {
            text-align: center;
            margin-top: 10px;
        }

        html, .main-content {
            background-color: #FFFFFF;
        }

    </style>

</head>
<body data-sidebar="dark">
<div id="layout-wrapper">
    <header id="page-topbar">
        <div class="navbar-header">
            <div class="d-flex">
                <!-- LOGO -->
                <div class="navbar-brand-box">

                    <a href="${pageContext.request.contextPath }/main" class="logo logo-light"> <span
                            class="logo-sm"> <img
                            src="${pageContext.request.contextPath }/resources/assets/images/logo-light.svg"
                            alt="" height="22">
                  </span> <span class="logo-lg"> <img
                            src="${pageContext.request.contextPath }/resources/image/logo1.png"
                            style="width: 200px; margin-top: 20px;">
                  </span>
                    </a>
                </div>

                <button type="button"
                        class="btn btn-sm px-3 font-size-16 header-item waves-effect"
                        id="vertical-menu-btn">
                    <i class="fa fa-fw fa-bars"></i>
                </button>

                <!-- App Search-->


            </div>

            <div class="d-flex">
                <div class="dropdown d-inline-block">
                    <button type="button" class="btn header-item waves-effect"
                            id="page-header-user-dropdown" data-bs-toggle="dropdown"
                            aria-haspopup="true" aria-expanded="false">
                        <img class="rounded-circle header-profile-user"
                             src="${pageContext.request.contextPath }/resources/assets/images/users/avatar-4.jpg"
                             alt="Header Avatar">
                        <sec:authorize access="isAuthenticated()">
                            <sec:authentication property="principal" var="pinfo"/>
                            <span class="d-none d-xl-inline-block ms-1" key="t-henry"
                                  id="loginId">${pinfo.username }</span>
                        </sec:authorize>
                        <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                    </button>

                    <div class="dropdown-menu dropdown-menu-end">
                        <!-- item-->

                        <a class="dropdown-item text-danger" href="${pageContext.request.contextPath }/member/logout">
                            <i class="bx bx-power-off font-size-16 align-middle me-1 text-danger"></i>
                            <span key="t-logout" id="submit">Logout</span></a>

                    </div>
                </div>
            </div>
        </div>
    </header>

    <div class="vertical-menu">

        <div data-simplebar="init" class="h-100">
            <div class="simplebar-wrapper" style="margin: 0px;">
                <div class="simplebar-height-auto-observer-wrapper">
                    <div class="simplebar-height-auto-observer"></div>
                </div>
                <div class="simplebar-mask">
                    <div class="simplebar-offset" style="right: -20px; bottom: 0px;">
                        <div class="simplebar-content-wrapper"
                             style="height: 100%; padding-right: 20px; padding-bottom: 0px; overflow: hidden scroll;">
                            <div class="simplebar-content" style="padding: 0px;">

                                <!--- Sidemenu -->
                                <div id="sidebar-menu" class="mm-active">
                                    <!-- Left Menu Start -->
                                    <ul class="metismenu list-unstyled" id="side-menu">
                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i
                                                class="bx bx-briefcase-alt-2"></i> <span key="t-ecommerce">프로젝트</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <li><a target="_self"
                                                       href="${pageContext.request.contextPath }/project/ProjectList"
                                                       id="project_list">전체</a>
                                                </li>

                                                <!--    <li><a>진행</a></li>
                                                    <li><a>마감</a></li>
                                                    <li><a>즐겨찾기</a></li> -->
                                            </ul>
                                        </li>

                                        <li><a href="${pageContext.request.contextPath }/member/calendar"
                                               class="waves-effect">
                                            <i class="bx bx-calendar"></i> <span>일정</span>
                                        </a>
                                        <li><a href="../chat/chatForm" class="waves-effect"><i
                                                class="bx bx-chat"></i> <span>채팅</span>
                                        </a></li>

                                        <!-- <li><a href="javascript: void(0);" class="waves-effect">
                                                    <i class="bx bx-envelope"></i> <span>이메일</span>
                                            </a></li> -->

                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i class="bx bx-detail"></i>
                                            <span>커뮤니티</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <li><a id="notice_List"
                                                       href="${pageContext.request.contextPath }/notice/noticeList">공지사항
                                                </a></li>
                                                <li><a id="freeBoard"
                                                       href="${pageContext.request.contextPath}/freeBoard/freeBoardList">자유
                                                    게시판</a></li>
                                            </ul>
                                        </li>

                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i class="bx bx-list-check"></i>
                                            <span>전자결재</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <li><a id="EDMS_List"
                                                       href="${pageContext.request.contextPath }/edms/approvalList">대쉬보드</a>
                                                </li>
                                                <li><a id="EDMS_myDoc"
                                                       href="${pageContext.request.contextPath }/edms/myDoc">기안함</a>
                                                </li>
                                                <li><a id="EDMS_myDocApp"
                                                       href="${pageContext.request.contextPath }/edms/myDocApp">결재함</a>
                                                </li>
                                            </ul>

                                        </li>

                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i class="bx bx-list-ul"></i>
                                            <span>예약</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <!--    <li><a>전자 결재</a></li> -->
                                                <li><a href="${pageContext.request.contextPath }/meet/rev">예약하기</a></li>
                                                <li><a href="${pageContext.request.contextPath }/meet/revstat">예약내역</a>
                                                </li>
                                            </ul>
                                        </li>

                                        <li><a id="mypage" class="waves-effect"
                                               href="${pageContext.request.contextPath }/member/mypage"> <i
                                                class="bx bx-user"></i> <span
                                                key="t-chat">내 프로필</span>
                                        </a></li>

                                        <li><a href="javascript: void(0);"
                                               class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                            <span>설정</span>
                                        </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                                <li><a id="passwordchange"
                                                       href="${pageContext.request.contextPath }/member/modifyPassword">비밀번호
                                                    변경</a></li>
                                                <!-- <li><a id="mysecurity" href="${pageContext.request.contextPath }/member/mysecurity">보안(미구현)</a></li>
                                       <li><a>알림(미구현)</a></li>
                                       <li><a>접속기기(미구현)</a></li>
                                        -->
                                            </ul>
                                        </li>

                                        <sec:authorize access="hasAnyAuthority('ROLE_ADMIN')">
                                            <li style="text-align: center"><a>👇 관리자 메뉴 👇</a></li>
                                            <li><a href="javascript: void(0);"
                                                   class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                                <span>회사 & 회의실</span>
                                            </a>
                                                <ul class="sub-menu" aria-expanded="false">
                                                    <li><a id="companyinfo"
                                                           href="${pageContext.request.contextPath }/admin/company">회사정보</a>
                                                    </li>
                                                    <li><a id="meetinfo"
                                                           href="${pageContext.request.contextPath }/admin/meetManage">회의실</a>
                                                    </li>
                                                    <!--     <li><a>조직도 관리(미구현)</a></li>
                                                        <li><a>회의실 예약 현황(미구현)</a></li>-->
                                                </ul>
                                            </li>
                                            <li><a href="javascript: void(0);"
                                                   class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                                <span>구성원</span>
                                            </a>
                                                <ul class="sub-menu" aria-expanded="false">
                                                    <li><a id="membersinfo"
                                                           href="${pageContext.request.contextPath }/admin/members">구성원
                                                        관리</a></li>
                                                    <!--    <li><a>구성원 초대(미구현)</a></li> -->
                                                </ul>
                                            </li>

                                            <!-- <li><a href="javascript: void(0);"
                                            class="has-arrow waves-effect"> <i class="bx bx-cog"></i>
                                            <span>전자결재</span>
                                            </a>
                                            <ul class="sub-menu" aria-expanded="false">
                                            <li><a>서식관리(미구현)</a></li>
                                            <li><a>조직도 관리(미구현)</a></li>
                                            <li><a>회의실 예약 현황(미구현)</a></li>

                                            </ul></li>
                                            -->
                                        </sec:authorize>
                                    </ul>
                                </div>
                                <!-- Sidebar -->
                            </div>
                        </div>
                    </div>
                </div>
                <div class="simplebar-placeholder"
                     style="width: auto; height: 1560px;"></div>
            </div>
            <div class="simplebar-track simplebar-horizontal"
                 style="visibility: hidden;">
                <div class="simplebar-scrollbar"
                     style="transform: translate3d(0px, 0px, 0px); display: none;"></div>
            </div>
            <div class="simplebar-track simplebar-vertical"
                 style="visibility: visible;">
                <div class="simplebar-scrollbar"
                     style="height: 950px; transform: translate3d(0px, 260px, 0px); display: block;"></div>
            </div>
        </div>
    </div>

</div>

<!-- footer -->
<footer class="footer text-center">
    <p>
        ©
        <script>
            document.write(new Date().getFullYear())
        </script>
        CO-WORK. <i class="mdi mdi-heart text-danger"></i> by Final Project
    </p>
</footer>
</body>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metismenu.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/sweetalert2/sweetalert2.all.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/js/pages/sweet-alerts.init.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/@chenfengyuan/datepicker/datepicker.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-timepicker/js/bootstrap-timepicker.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-touchspin/jquery.bootstrap-touchspin.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>
<script
        src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap-datepicker/locales/bootstrap-datepicker.ko.min.js"></script>
<script
        src="https://cdnjs.cloudflare.com/ajax/libs/TableDnD/0.9.1/jquery.tablednd.js"
        integrity="sha256-d3rtug+Hg1GZPB7Y/yTcRixO/wlI78+2m08tosoRn7A="
        crossorigin="anonymous"></script>
<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>

<script src="${pageContext.request.contextPath }/resources/assets/libs/dropzone/min/dropzone.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_add.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/js/project_js/project_list_onload.js"></script>


<script>
</script>


</html>