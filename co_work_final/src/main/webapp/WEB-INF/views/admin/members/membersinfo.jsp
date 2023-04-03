<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../../main/header.jsp"></jsp:include>
<meta name="_csrf_parameter" content="${_csrf.parameterName}"/>
<meta name="_csrf_header" content="${_csrf.headerName}"/>
<meta name="_csrf" content="${_csrf.token}"/>
<title>구성원 관리</title>
<style>
    th, tr {
        text-align: center;
    }
</style>
<script>

    var user_id = "";
    var user_name = "";
    var user_dept = "";
    var user_job = "";
    var user_phone = "";
    var user_fax = "";
    var user_email = "";

    $(document).ready(function () {

        $('#info').on('show.bs.modal', function (event) {
            user_id = $(event.relatedTarget).data('user_id');
            user_name = $(event.relatedTarget).data('user_name');
            user_dept = $(event.relatedTarget).data('user_dept');
            user_job = $(event.relatedTarget).data('user_job');
            user_phone = $(event.relatedTarget).data('user_phone');
            user_fax = $(event.relatedTarget).data('user_fax');
            user_email = $(event.relatedTarget).data('user_email');

            $("#user_name").val(user_name)
            $("#user_id").val(user_id)
            $("#user_dept").val(user_dept)
            $("#user_job").val(user_job)
            $("#user_phone").val(user_phone)
            $("#user_fax").val(user_fax)
            $("#user_email").val(user_email)


            $("#info").on('keyup change', function () {
                user_name = $("#user_name").val()
                user_dept = $("#user_dept :selected").val()
                user_job = $("#user_job :selected").val()
                user_phone = $("#user_phone").val()
                user_fax = $("#user_fax").val()
                user_email = $("#user_email").val()

                $("#modalSubmit").attr("disabled", false);

                // $.ajax({
                //     url: "../admin/updateCheck",
                //     type: "post",
                //     data: ({
                //         "user_name" : user_name,
                //         "user_dept" : user_dept,
                //         "user_job" : user_job,
                //         "user_phone" : user_phone,
                //         "user_fax" : user_fax,
                //         "user_email" : user_email
                //     }),
                //     success: function (resp) {
                //         if (resp == 'success' || img) {
                //             $("button[type=submit]").attr("disabled", false);
                //         } else if (resp == 'fail' || !img) {
                //             $("button[type=submit]").attr("disabled", true);
                //         }
                //     }
                // }) // ajax end
            })

        });

        $(document).on("change", "#user_auth", function () {
            var user_auth = $(this).val();
            var user_id = $(this).find('option:selected').attr("value2");
            console.log(user_id);

            $.ajax({
                url: '../admin/authUpdate',
                data: {
                    "user_id": user_id,
                    "user_auth": user_auth
                },
                complete: function (resp) {
                    console.log("성공인가")
                    location.reload();
                }
            })
        });

        $(document).on("click", "#stateChange", function () {
            var clickData = $(this).text();
            var fullUser_id = $(this).parents().eq(1).children().eq(2).children().eq(1).text();
            var user_id = fullUser_id.substring(1, fullUser_id.length - 1);
            var user_auth = "";
            var user_state = "";

            if (clickData.trim() == '중지') {
                user_auth = "ROLE_WAIT";
                user_state = "ST";
            } else if (clickData.trim() == '승인') {
                user_auth = "ROLE_MEMBER";
                user_state = "CP";
            } else if (clickData.trim() == '복구') {
                user_auth = "ROLE_MEMBER";
                user_state = "CP";
            }

            $.ajax({
                url: '../admin/stateUpdate',
                data: {
                    "user_id": user_id,
                    "user_auth": user_auth,
                    "user_state": user_state
                },
                complete: function (resp) {
                    location.reload();
                }
            })
        })

    });


</script>
</head>
<body>
<div class="main-content">
    <div class="page-content">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0 font-size-18">구성원> 구성원 관리</h4>

                    </div>
                </div>
            </div>
            <div class="col-12">
                <div class="card">
                    <div class="card-body">
                        <!-- Nav tabs -->
                        <ul class="nav nav-tabs" role="tablist">
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link active"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#home-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="true">
                           <span class="d-block d-sm-none">
                              <i class="fas fa-home"></i>
                           </span>
                                <span class="d-none d-sm-block">전체</span>
                            </a></li>
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#profile-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="false"
                                                                                                 tabindex="-1">
                           <span class="d-block d-sm-none">
                              <i class="far fa-user"></i>
                           </span>
                                <span class="d-none d-sm-block">승인</span>
                            </a></li>
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#messages-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="false"
                                                                                                 tabindex="-1">
                           <span class="d-block d-sm-none">
                              <i class="far fa-envelope"></i>
                           </span>
                                <span class="d-none d-sm-block">승인 대기</span>
                            </a></li>
                            <li class="nav-item waves-effect waves-light" role="presentation"><a class="nav-link"
                                                                                                 data-bs-toggle="tab"
                                                                                                 href="#settings-1"
                                                                                                 role="tab"
                                                                                                 aria-selected="false"
                                                                                                 tabindex="-1">
                           <span class="d-block d-sm-none">
                              <i class="fas fa-cog"></i>
                           </span>
                                <span class="d-none d-sm-block">이용 중지</span>
                            </a></li>
                        </ul>

                        <!-- Tab panes -->

                        <div class="tab-content p-3 text-muted">
                            <div class="tab-pane active" id="home-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table align-middle table-nowrap table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="allCheck"></th>
                                            <th>#</th>
                                            <th>이름</th>
                                            <th>부서/직책</th>
                                            <th>이메일</th>
                                            <th>가입일</th>
                                            <th>사용자 권한</th>
                                            <th>상태</th>
                                            <th>관리</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${list }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="memCheck">
                                                </td>
                                                <td>
                                                    <div>
                                                        <img class="rounded-circle avatar-xs"
                                                             src="../upload${m.user_card}" alt="">
                                                    </div>
                                                </td>
                                                <td>
                                                    <h5 class="font-size-14 mb-1"><a href=".."
                                                                                     class="text-dark">${m.user_name}</a>
                                                    </h5>
                                                    <p class="text-muted mb-0">(${m.user_id})</p>
                                                </td>
                                                <td>${m.dept_name }/${m.job_name}</td>
                                                <td>
                                                    <a href="#">${m.user_email }</a>
                                                </td>
                                                <td>${m.user_join_date }</td>

                                                <c:if test="${m.user_auth eq 'ROLE_MEMBER' }">
                                                    <td>일반 사용자</td>
                                                </c:if>
                                                <c:if test="${m.user_auth eq 'ROLE_ADMIN' }">
                                                    <td>관리자</td>
                                                </c:if>
                                                <c:if test="${m.user_auth eq 'ROLE_WAIT' }">
                                                    <td>권한없음</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.user_state eq 'WT'}">
                                                    <td>
                                                        <span class="badge bg-info font-size-12">대기중</span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.user_state eq 'CP'}">
                                                    <td>
                                                        <span class="badge bg-success font-size-12">정상</span>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.user_state eq 'ST'}">
                                                    <td>
                                                        <span class="badge bg-danger font-size-12">이용 중지</span>
                                                    </td>
                                                </c:if>

                                                <td>
                                                    <button type="button"
                                                            class="btn btn-primary btn-sm waves-effect waves-light m-1"
                                                            data-bs-toggle="modal" data-bs-target="#info"
                                                            data-user_name="${m.user_name}"
                                                            data-user_id="${m.user_id}"
                                                            data-user_email="${m.user_email}"
                                                            data-user_dept="${m.user_dept}"
                                                            data-user_job="${m.user_job}"
                                                            data-user_phone="${m.user_phone}"
                                                            data-user_fax="${m.user_fax}">정보수정
                                                    </button>
                                                    <c:if test="${m.user_state eq 'CP'}">
                                                        <select class="btn btn-light btn-sm waves-effect"
                                                                style="width: 80px;" name="user_auth" id="user_auth">
                                                            <option value="" selected>권한설정</option>
                                                            <option value="ROLE_ADMIN" value2="${m.user_id}">관리자
                                                            </option>
                                                            <option value="ROLE_MEMBER" value2="${m.user_id}">일반 사용자
                                                            </option>
                                                        </select>
                                                        <button type="button"
                                                                class="btn btn-danger btn-sm waves-effect waves-light m-1"
                                                                id="stateChange">중지
                                                        </button>
                                                    </c:if> <c:if test="${m.user_state eq 'WT'}">
                                                    <select class="btn btn-light btn-sm waves-effect"
                                                            style="width: 80px;" name="user_auth" id="user_auth">
                                                        <option value="" selected>권한설정</option>
                                                        <option value="ROLE_ADMIN" value2="${m.user_id}">관리자</option>
                                                        <option value="ROLE_MEMBER" value2="${m.user_id}">일반 사용자
                                                        </option>
                                                    </select>
                                                    <button type="button"
                                                            class="btn btn-info btn-sm waves-effect waves-light m-1"
                                                            id="stateChange">승인
                                                    </button>
                                                </c:if> <c:if test="${m.user_state eq 'ST'}">
                                                    <select class="btn btn-light btn-sm waves-effect"
                                                            style="width: 80px; cursor: no-drop" name="user_auth"
                                                            id="user_auth" disabled>
                                                        <option value="" selected>권한설정</option>
                                                        <option value="ROLE_ADMIN" value2="${m.user_id}">관리자</option>
                                                        <option value="ROLE_MEMBER" value2="${m.user_id}">일반 사용자
                                                        </option>
                                                    </select>
                                                    <button type="button"
                                                            class="btn btn-success btn-sm waves-effect waves-light m-1"
                                                            id="stateChange">복구
                                                    </button>
                                                </c:if>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane" id="profile-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table mb-1 table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="formCheck1"></th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>마지막 접속</th>
                                            <th>상태</th>
                                            <th>관리자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${normal }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="formCheck2">
                                                </td>
                                                <td>
                                                    <a name="meminfo" href="mypage.my?user_id=${m.USER_ID }"
                                                       }">${m.USER_NAME }</a>
                                                </td>
                                                <td>${m.USER_DEPT }</td>
                                                <td>${m.USER_JOB }</td>
                                                <td>
                                                    <a href="#">${m.USER_EMAIL }</a>
                                                </td>
                                                <td>${m.USER_PHONE }</td>
                                                <td>${m.USER_JOIN_DATE }</td>
                                                <c:if test="${!empty m.USER_LASTTIME }">
                                                    <td>${m.USER_LASTTIME }</td>
                                                </c:if>
                                                <c:if test="${empty m.USER_LASTTIME }">
                                                    <td>미접속</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.USER_STATE eq 0}">
                                                    <td style="color: green;">
                                                        <span>정상</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 1}">
                                                    <td style="color: red;">
                                                        <span>중지</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[정상]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 2}">
                                                    <td style="color: orange">
                                                        <span>승인 대기</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[승인]</a>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>

                                                <!-- 관리자 표시 -->
                                                <c:if test="${m.USER_IS_ADMIN eq 1}">
                                                    <td>
                                                        관리자<br>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=0">[해제]</a>

                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_IS_ADMIN eq 0}">
                                                    <td>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=1">[지정]</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane" id="messages-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table mb-1 table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="formCheck1"></th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>마지막 접속</th>
                                            <th>상태</th>
                                            <th>관리자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${wait }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="formCheck2">
                                                </td>
                                                <td>
                                                    <a name="meminfo" href="mypage.my?user_id=${m.USER_ID }"
                                                       }">${m.USER_NAME }</a>
                                                </td>
                                                <td>${m.USER_DEPT }</td>
                                                <td>${m.USER_JOB }</td>
                                                <td>
                                                    <a href="#">${m.USER_EMAIL }</a>
                                                </td>
                                                <td>${m.USER_PHONE }</td>
                                                <td>${m.USER_JOIN_DATE }</td>
                                                <c:if test="${!empty m.USER_LASTTIME }">
                                                    <td>${m.USER_LASTTIME }</td>
                                                </c:if>
                                                <c:if test="${empty m.USER_LASTTIME }">
                                                    <td>미접속</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.USER_STATE eq 0}">
                                                    <td style="color: green;">
                                                        <span>정상</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 1}">
                                                    <td style="color: red;">
                                                        <span>중지</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[정상]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 2}">
                                                    <td style="color: orange">
                                                        <span>승인 대기</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[승인]</a>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>

                                                <!-- 관리자 표시 -->
                                                <c:if test="${m.USER_IS_ADMIN eq 1}">
                                                    <td>
                                                        관리자<br>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=0">[해제]</a>

                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_IS_ADMIN eq 0}">
                                                    <td>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=1">[지정]</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>

                            <div class="tab-pane" id="settings-1" role="tabpanel">
                                <div class="table-responsive">
                                    <table class="table mb-1 table-hover">
                                        <thead>
                                        <tr role="row">
                                            <th><input class="form-check-input" type="checkbox" id="formCheck1"></th>
                                            <th>이름</th>
                                            <th>부서</th>
                                            <th>직책</th>
                                            <th>이메일</th>
                                            <th>연락처</th>
                                            <th>가입일</th>
                                            <th>마지막 접속</th>
                                            <th>상태</th>
                                            <th>관리자</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                        <c:forEach var="m" items="${stop }">
                                            <tr>
                                                <td>
                                                    <input class="form-check-input" type="checkbox" id="formCheck2">
                                                </td>
                                                <td>
                                                    <a name="meminfo" href="mypage.my?user_id=${m.USER_ID }"
                                                       }">${m.USER_NAME }</a>
                                                </td>
                                                <td>${m.USER_DEPT }</td>
                                                <td>${m.USER_JOB }</td>
                                                <td>
                                                    <a href="#">${m.USER_EMAIL }</a>
                                                </td>
                                                <td>${m.USER_PHONE }</td>
                                                <td>${m.USER_JOIN_DATE }</td>
                                                <c:if test="${!empty m.USER_LASTTIME }">
                                                    <td>${m.USER_LASTTIME }</td>
                                                </c:if>
                                                <c:if test="${empty m.USER_LASTTIME }">
                                                    <td>미접속</td>
                                                </c:if>

                                                <!-- 상태 표시 -->
                                                <c:if test="${m.USER_STATE eq 0}">
                                                    <td style="color: green;">
                                                        <span>정상</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 1}">
                                                    <td style="color: red;">
                                                        <span>중지</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[정상]</a>
                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_STATE eq 2}">
                                                    <td style="color: orange">
                                                        <span>승인 대기</span>
                                                        <br>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=0">[승인]</a>
                                                        <a name="stat"
                                                           href="memberstatus.com?user_id=${m.USER_ID }&state=1">[중지]</a>
                                                    </td>
                                                </c:if>

                                                <!-- 관리자 표시 -->
                                                <c:if test="${m.USER_IS_ADMIN eq 1}">
                                                    <td>
                                                        관리자<br>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=0">[해제]</a>

                                                    </td>
                                                </c:if>
                                                <c:if test="${m.USER_IS_ADMIN eq 0}">
                                                    <td>
                                                        <a href="adminright.com?user_id=${m.USER_ID }&user_is_admin=1">[지정]</a>
                                                    </td>
                                                </c:if>
                                            </tr>
                                        </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%--MODAL...--%>
<div class="modal fade" id="info" data-bs-backdrop="static" data-bs-keyboard="false"
     tabindex="-1" aria-labelledby="staticBackdropLabel" style="display: none;" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="staticBackdropLabel">정보수정</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"
                        aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="../admin/memUpdate" method="post">
                    <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                    <div class="mb-3 row">
                        <label for="user_id" class="col-md-2 col-form-label">아이디</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" value="" id="user_id" name="user_id" readonly>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="user_name" class="col-md-2 col-form-label">이름</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" value="" id="user_name" name="user_name">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="user_name" class="col-md-2 col-form-label">부서</label>
                        <div class="col-md-10">

                            <select class="form-select" name="user_dept" id="user_dept">
                                <option value="" selected>부서를 선택해주세요</option>
                                <c:forEach var="d" items="${deptList }">
                                    <option value="${d.dept_no}">${d.dept_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="user_name" class="col-md-2 col-form-label">직급</label>
                        <div class="col-md-10">
                            <select class="form-select" name="user_job" id="user_job">
                                <option value="">직급을 선택해주세요</option>
                                <c:forEach var="j" items="${jobList }">
                                    <option value="${j.job_no}">${j.job_name}</option>
                                </c:forEach>
                            </select>
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="user_phone" class="col-md-2 col-form-label">연락처</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" value="" id="user_phone" name="user_phone">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="user_fax" class="col-md-2 col-form-label">팩스</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" value="" id="user_fax" name="user_fax">
                        </div>
                    </div>
                    <div class="mb-3 row">
                        <label for="user_email" class="col-md-2 col-form-label">이메일</label>
                        <div class="col-md-10">
                            <input class="form-control" type="text" value="" id="user_email" name="user_email">
                        </div>
                    </div>


                    <div class="modal-footer">
                        <div class="col-sm-7">
                            <div>
                                <button type="submit" class="btn btn-primary" id="modalSubmit" disabled>저장</button>
                                <button type="button" class="btn btn-light" data-bs-dismiss="modal">
                                    닫기
                                </button>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
<script src="${pageContext.request.contextPath }/resources/assets/js/admin_js/members.js"></script>
</html>