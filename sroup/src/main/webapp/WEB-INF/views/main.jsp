<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="kr">

<head>

   	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>SROUP - Main</title>

    <!-- Bootstrap Core CSS -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">

    <!-- Custom Fonts -->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:300italic,400italic,600italic,700italic,800italic,400,300,600,700,800' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic,900,900italic' rel='stylesheet' type='text/css'>
    <link rel="stylesheet" href="resources/font-awesome/css/font-awesome.min.css" type="text/css">

    <!-- Plugin CSS -->
    <link rel="stylesheet" href="resources/css/animate.min.css" type="text/css">

    <!-- Custom CSS -->
    <link rel="stylesheet" href="resources/css/creative.css" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body id="page-top">
	
	<%@ include file="navbar.jsp" %>
	
    <header>
        <div class="header-content">
            <div class="header-content-inner">
                <h1>SROUP</h1>
                <h3>study group service</h3> 
                <hr/>
                <p>외국어, 전문지식 공부, 학교공부, 취미 스터디까지 ! <br>당신이 참여하고 싶은 스터디를 찾아보세요</p>
                <a href="#portfolio" class="btn btn-primary btn-xl page-scroll">스터디 찾으러 가기</a>
            </div>
        </div>
    </header>

    <section class="bg-primary" id="about">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">너 내 동료가 되라</h2>
                    <hr class="light">
                    <p class="text-faded">SROUP의 회원이 되서 당신이 원하는 스터디에 가입해보세요. 찾는 스터디가 없으신가요? SROUP의 회원이 되면 당신이 원하는 스터디를 만들수 있고 관리페이지 또한 제공됩니다!</p>
                    <a href="/sroup/login/signup.do" class="btn btn-default btn-xl">회원가입 하러가기</a>
                </div>
            </div>
        </div>
    </section>

    <section id="services">
        <div class="container">
            <div class="row">
                <div class="col-lg-12 text-center">
                    <h2 class="section-heading">회원이 되면?</h2>
                    <hr class="primary">
                </div>
            </div>
        </div>
        <div class="container">
            <div class="row">
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-diamond wow bounceIn text-primary"></i>
                        <h3>스터디 찾기</h3>
                        <p class="text-muted">외국어, 취미 등등의 카테고리와 지역 카테고리로도 검색이 가능해요!</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-paper-plane wow bounceIn text-primary" data-wow-delay=".1s"></i>
                        <h3>스터디 개설</h3>
                        <p class="text-muted">당신이 원하는 스터디를 직접 개설할수 있습니다!</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-newspaper-o wow bounceIn text-primary" data-wow-delay=".2s"></i>
                        <h3>스터디 관리</h3>
                        <p class="text-muted">개설, 홍보에서 끝나지 않고 스터디 시작후에도 관리페이지 제공!</p>
                    </div>
                </div>
                <div class="col-lg-3 col-md-6 text-center">
                    <div class="service-box">
                        <i class="fa fa-4x fa-heart wow bounceIn text-primary" data-wow-delay=".3s"></i>
                        <h3>새로운 사람들</h3>
                        <p class="text-muted">공부도 하고 새로운 친구도 생기고 일석이조! </p>
                    </div>
                </div>
            </div>
        </div>
    </section>

    <section class="no-padding" id="portfolio">
        <div class="container-fluid">
            <div class="row no-gutter">
            	
            	<c:forEach var="study" items="${studyList }">
            		<div class="col-lg-4 col-sm-6">
	                    <a href="/sroup/detail.do?no=${study.study_no }" class="portfolio-box">
	                        <img src="${study.s_image }" class="img-responsive" alt="">
	                        <div class="portfolio-box-caption">
	                            <div class="portfolio-box-caption-content">
	                                <div class="project-category text-faded">
	                                    ${study.c_subject }
	                                </div>
	                                <div class="project-name">
	                                    ${study.study_name }
	                                </div>
	                            </div>
	                        </div>
	                    </a>
	                </div>
            	</c:forEach>
               <!--  <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="https://unsplash.it/650/350?image=535" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="https://unsplash.it/650/350?image=534" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="https://unsplash.it/650/350?image=532" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="https://unsplash.it/650/350?image=533" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="https://unsplash.it/650/350?image=531" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div>
                <div class="col-lg-4 col-sm-6">
                    <a href="#" class="portfolio-box">
                        <img src="https://unsplash.it/650/350?image=625" class="img-responsive" alt="">
                        <div class="portfolio-box-caption">
                            <div class="portfolio-box-caption-content">
                                <div class="project-category text-faded">
                                    Category
                                </div>
                                <div class="project-name">
                                    Project Name
                                </div>
                            </div>
                        </div>
                    </a>
                </div> -->
            </div>
        </div>
    </section>

    <aside class="bg-dark">
        <div class="container text-center">
            <div class="call-to-action">
                <h2>더 많은 스터디 보러가기</h2>
                <a href="/sroup/list.do" class="btn btn-default btn-xl wow tada">스터디 목록</a>
            </div>
        </div>
    </aside>

    <section id="contact">
        <div class="container">
            <div class="row">
                <div class="col-lg-8 col-lg-offset-2 text-center">
                    <h2 class="section-heading">궁금한 점이 있으신가요?</h2>
                    <hr class="primary">
                    <p>SROUP의 고객센터는 24시간 항상 열려있습니다. 언제든지 문의 주세요.</p>
                </div>
                <div class="col-lg-4 col-lg-offset-2 text-center">
                    <i class="fa fa-phone fa-3x wow bounceIn"></i>
                    <p>010-5023-3718</p>
                </div>
                <div class="col-lg-4 text-center">
                    <i class="fa fa-envelope-o fa-3x wow bounceIn" data-wow-delay=".1s"></i>
                    <p><a href="mailto:ccj9207@gmail.com">ccj9207@gmail.com</a></p>
                </div>
            </div>
        </div>
    </section>

    <!-- jQuery -->
    <script src="/sroup/resources/jquery/jquery-1.11.3.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

    <!-- Plugin JavaScript -->
    <script src="/sroup/resources/js/jquery.easing.min.js"></script>
    <script src="/sroup/resources/js/jquery.fittext.js"></script>
    <script src="/sroup/resources/js/wow.min.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/sroup/resources/js/creative.js"></script>

</body>

</html>
