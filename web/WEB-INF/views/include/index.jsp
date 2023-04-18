<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="header.jsp"%>

<style>
    .mainImg{
        width: 90%;
        height: 100%;
        margin: auto;
        display: block
    }
    .cardFont{
        font-size: 1.4rem;
        color: #666666;
    }
</style>


<div id="carouselExampleIndicators" class="carousel slide" data-bs-ride="true">
    <div class="carousel-indicators">
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="0" class="active"  aria-current="true" aria-label="Slide 1"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="1" aria-label="Slide 2"></button>
        <button type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide-to="2" aria-label="Slide 3"></button>
    </div>
    <div class="carousel-inner mainImg">
        <div class="carousel-item active" >
            <img src="/images/main/m03.jpeg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" >
            <img src="/images/main/m02.jpeg" class="d-block w-100" alt="...">
        </div>
        <div class="carousel-item" >
            <img src="/images/main/m01.jpeg" class="d-block w-100" alt="...">
        </div>
    </div>
    <button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Previous</span>
    </button>
    <button class="carousel-control-next" type="button" data-bs-target="#carouselExampleIndicators" data-bs-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="visually-hidden">Next</span>
    </button>
</div>

<!-- 임시로 넣어둠 -->
<div class="campagine-section text-center pt-5 mb-5">
    <h3 style="font-size: 1.75rem">
        JOURNEY CAMPING FOR THE HOLIDAYS
    </h3>
    <div class="pt-4"></div>
    <button type="button" class="btn btn-dark" onclick="location.href='campPage'">Discover the Reservation</button>
</div>
<div class="container pb-5">
    <div class="row">
        <div class="col-md-4 col-sm-12">
            <div class="card">
                <img src="images/main/theme01.jpeg" class="card-img-top" alt="...">
                <div class="card-body text-center">
                    <h2 class="card-text cardFont">Be With Nature</h2>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-12">
            <div class="card">
                <img src="images/main/theme02.jpeg" class="card-img-top">
                <div class="card-body">
                    <h2 class="card-text text-center cardFont">Gift For Me</h2>
                </div>
            </div>
        </div>
        <div class="col-md-4 col-sm-12">
            <div class="card">
                <img src="images/main/theme03.jpeg" class="card-img-top" alt="...">
                <div class="card-body">
                    <h2 class="card-text text-center cardFont">Relax In Life</h2>
                </div>
            </div>
        </div>
    </div>
</div>






<%@ include file="footer.jsp"%>