<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<div id="container">
        <article id="adver_video" class="article">
            <video type="video/mp4" autoplay muted controls loop>
                <source src="img/adver_video.mp4">
            </video>
            <div id="scrolldown">
                <p>scrolldown</p>
                <img src="img/scrolldown.png" alt="scrolldown"/>
            </div>
        </article>
        <article id="todaysCodi" class="article">
            <h1>패션 피플들의 데일리룩</h1>
            <a href="">오늘의 코디</a>
            <div id="lookTop3">
                <p>TOP 3</p>
                <ul>
                    <li>
                        <span>1st</span>
                        <img src="img/crown_gold.png">
                        <p class="codi_hover"><a href="">자세히 보기</a></p>
                    </li>
                    <li>
                        <span>2nd</span>
                        <img src="img/crown_silver.png">
                        <p class="codi_hover"><a href="">자세히 보기</a></p>
                    </li>
                    <li>
                        <span>3rd</span>
                        <img src="img/crown_bronze.png">
                        <p class="codi_hover"><a href="">자세히 보기</a></p>
                    </li>
                </ul>
            </div>
            <!-- count particles -->
            <div class="count-particles">
                <span class="js-count-particles"></span>
            </div>
            
            <!-- particles.js container -->
            <div id="particles-js"></div>
            
            <!-- scripts -->
            <script src="../particles.js"></script>
            <script src="js/app.js"></script>
        </article>
        <article id="style_reco" class="article"></article>
        <article id="purchase" class="article"></article>
        <article id="review" class="article"></article>
        <article id="QnA" class="article"></article>
        <article id="vote" class="article"></article>
        <article id="codi_book" class="article"></article>
    </div>