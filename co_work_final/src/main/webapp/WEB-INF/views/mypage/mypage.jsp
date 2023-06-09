<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="../main/header.jsp"/>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/assets/js/mypage_js/mypage.js"></script>

<head>
    <title>내 프로필</title>
    <style>
        #showImage1 > img {
            width: 200px;
            height: 200px;
        }

        #showImage2 > img {
            width: 200px;
            height: 111px;
        }

        .form-control {
            border: none;
            border-bottom: 1px solid #CCC;
            border-radius: 0;
        }

        .form-control:read-write:focus {
            border-bottom: 2px solid blue;
        }

    </style>
    <script>

    </script>
</head>

<body>
<div class="main-content">
    <div class="page-content ">
        <div class="container-fluid">
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex justify-content-center">
                        <h3 class="mb-sm-0 font-size-24">내 프로필> 수정</h3>
                    </div>
                </div>
            </div>

            <form name="update" action="../member/updateProcess" method="post" enctype="multipart/form-data">
                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">

                <div class="row">
                    <div class="col-12">
                        <div class="row d-flex justify-content-center mb-5">
                            <div class="col-3">
                                <div>
                                    <img class="card-img-top img-fluid" src="../upload${path}"
                                         style="width: 200px; height: 200px">
                                    <div class="d-flex justify-content-center mt-3 filebox" style="width: 200px;">
                                        <input class="form-control" type="file" id="imgupload" name="imgupload"
                                               accept=".jpg, .png">
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="col-6">
                        <div class="col-10  align-items-center container-fluid">
                            <label class="form-label" for="user_id"><b>아이디</b></label>
                            <div class="input-group" id="user_id">
                                <input type="text" class="form-control" name="user_id" value="${memberinfo.user_id}"
                                       readonly>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_dept"><b>부서</b></label>
                            <div class="input-group" id="user_dept">
                                <c:if test="${deptName == null}">
                                    <input type="text" class="form-control" name="user_dept" readonly style="font-weight: bold" placeholder="관리자에게 문의하세요.">
                                </c:if>
                                <c:if test="${deptName != null}">
                                    <input type="text" class="form-control" name="user_dept" value="${deptName}"
                                           readonly>
                                </c:if>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_phone"><b>연락처</b></label>
                            <div class="input-group" id="user_phone">
<%--                                <input type="text" class="form-control" name="user_phone"
                                       value="${memberinfo.user_phone}"> --%>
                                       <input class="form-control" name="user_phone" value="${memberinfo.user_phone}">
                                       
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_email"><b>이메일</b></label>
                            <div class="input-group" id="user_email">
                                <input type="text" class="form-control" name="user_email"
                                       value="${memberinfo.user_email}" readonly>
                            </div>
                        </div>

                    </div>

                    <div class="col-6" style="">
                        <div class="col-10  align-items-center container-fluid">
                            <label class="form-label" for="user_name"><b>이름</b></label>
                            <div class="input-group" id="user_name">
                                <input type="text" class="form-control" name="user_name" value="${memberinfo.user_name}"
                                       readonly>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_job"><b>직급</b></label>
                            <div class="input-group" id="user_job">
                                <c:if test="${jobName == null}">
                                    <input type="text" class="form-control" name="user_job" readonly style="font-weight: bold" placeholder="관리자에게 문의하세요.">>
                                </c:if>
                                <c:if test="${jobName != null}">
                                    <input type="text" class="form-control" name="user_job" value="${jobName}"
                                           readonly>
                                </c:if>
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_fax"><b>팩스번호</b></label>
                            <div class="input-group" id="user_fax">
<%--                                 <input type="text" class="form-control" name="user_fax" value="${memberinfo.user_fax}"> --%>
                                <input class="form-control" name="user_fax" value="${memberinfo.user_fax}">
                            </div>
                        </div>

                        <div class="col-10 mt-5  align-items-center container-fluid">
                            <label class="form-label" for="user_join_date"><b>입사일</b></label>
                            <div class="input-group" id="user_join_date">
                                <input type="text" class="form-control" name="user_join_date"
                                       value="${memberinfo.user_join_date}" readonly>
                            </div>
                        </div>


                    </div>

                    <div class="col-xl-12 mt-5 d-flex justify-content-center">
                        <button type="submit" class="btn btn-primary waves-effect waves-light m-1" disabled>정보변경
                        </button>
                    </div>
                </div>
            </form>

        </div>
    </div>
    <!-- End Page-content -->
</div>
</body>
<script src="../assets/libs/inputmask/min/jquery.inputmask.bundle.min.js"></script>
<script src="../assets/js/pages/form-mask.init.js"></script>
<script>

</script>
</html>