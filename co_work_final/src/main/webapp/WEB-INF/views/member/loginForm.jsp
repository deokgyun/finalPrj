<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<head>
    <meta charset="utf-8"/>
    <title>로그인</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description"/>
    <meta content="Themesbrand" name="author"/>
    <!-- App favicon -->
    <link rel="shortcut icon" href="${pageContext.request.contextPath }/resources/assets/images/favicon.ico">

    <!-- owl.carousel css -->
    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/assets/owl.carousel.min.css">

    <link rel="stylesheet"
          href="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/assets/owl.theme.default.min.css">

    <!-- Bootstrap Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/bootstrap.min.css" id="bootstrap-style"
          rel="stylesheet" type="text/css"/>
    <!-- Icons Css -->
    <link href="${pageContext.request.contextPath }/resources/assets/css/icons.min.css" rel="stylesheet"
          type="text/css"/>
    <!-- App Css-->
    <link href="${pageContext.request.contextPath }/resources/assets/css/app.min.css" id="app-style" rel="stylesheet"
          type="text/css"/>

</head>
<body class="auth-body-bg">
<div class="account-pages my-5 pt-sm-5">
    <div class="container">
        <div class="row justify-content-center">
            <div class="col-md-8 col-lg-6 col-xl-5">
                <div class="card overflow-hidden">
                    <div class="bg-primary bg-soft">
                        <div class="row">
                            <div class="col-7">
                                <div class="text-primary p-4">
                                    <h5 class="text-primary">UNnamed</h5>
                                </div>
                            </div>
                            <div class="col-5 align-self-end">
                                <img src="assets/images/profile-img.png" alt="" class="img-fluid">
                            </div>
                        </div>
                    </div>
                    <div class="card-body pt-0">
                        <div class="p-2">
                            <form name="loginform" action="${pageContext.request.contextPath }/member/loginProcess" method="post">
                                <div class="mb-3">
                                    <label for="username" class="form-label">아이디</label>
                                    <input type="text" class="form-control" id="username" name="username"
                                           placeholder="Enter id" required>
                                </div>
                                <div class="mb-3">
                                    <label class="pass">비밀번호</label>
                                    <input type="password" class="form-control" id="pass"
                                           aria-label="Password" placeholder="Enter password" name="pass" required
                                           aria-describedby="password-addon">
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="checkbox" id="autoLogin"
                                           name="remember-me">
                                    <label class="form-check-label" for="autoLogin">
                                        자동 로그인
                                    </label>
                                </div>
                                <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
                                <div class="mt-3 d-grid">
                                    <button class="btn btn-primary waves-effect waves-light"
                                            type="submit">로그인
                                    </button>
                                </div>
                                <div class="mt-4 text-center row">
                                    <div class="col-6">
                                        <p><a href="${pageContext.request.contextPath }/member/join" class="fw-medium text-primary"> 회원가입 </a></p>
                                    </div>
                                    <div class="col-6">
                                        <a href="auth-recoverpw.html" class="text-muted"><i
                                                class="mdi mdi-lock me-1"></i> 비밀번호 찾기</a>
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- JAVASCRIPT -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/jquery/jquery.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/metismenu/metisMenu.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/simplebar/simplebar.min.js"></script>
<script src="${pageContext.request.contextPath }/resources/assets/libs/node-waves/waves.min.js"></script>
<!-- owl.carousel js -->
<script src="${pageContext.request.contextPath }/resources/assets/libs/owl.carousel/owl.carousel.min.js"></script>
<!-- auth-2-carousel init -->
<script src="${pageContext.request.contextPath }/resources/assets/js/pages/auth-2-carousel.init.js"></script>
<!-- App js -->
<script src="${pageContext.request.contextPath }/resources/assets/js/app.js"></script>
</body>
</html>