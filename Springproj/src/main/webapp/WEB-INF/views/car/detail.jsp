<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!-- detail.jsp -->
<%@ include file="../top.jsp" %>

<!-- Product section-->
<section class="py-5" style="background-color: #f8f9fa">
    <div class="container px-4 px-lg-5 my-5">
        <div class="row gx-4 gx-lg-5 align-items-center">
            <div class="col-md-6">
                <img class="card-img-top mb-5 mb-md-0" src="https://picsum.photos/seed/${getCar.id}/600/700" alt="product_image" />
<%--                <img class="card-img-top mb-5 mb-md-0" src="${getCarImage.image}" alt="product_image" />--%>
            </div>
            <div class="col-md-6">
                <!-- 상품코드 -->
                <div class="small mb-1">차량: ${getCar.code}</div>
                <div class="small mb-1">차종: <a href="<c:url value="/car/type_detail?id=${getCarType.id}"/>">${getCarType.name}</a></div>
                <!-- 상품이름 -->
                <h1 class="display-5 fw-bolder">${getCar.name}</h1>
                <!-- 상품가격 -->
                <div class="fs-5 mb-5">
                    <span>${getCar.price}원</span>
                </div>
                <!-- 상품설명 -->
                <p class="lead">${getCar.description}</p>
                <!-- 옵션 -->
                <div class="small mb-1">
                    <p>탑승인원: ${getCar.passenger} 명</p>
                    <p>트렁크 공간: ${getCar.luggage}</p>
                    <p>문: ${getCar.door} 개</p>
                    <p>트랜스미션: ${getCar.transmission}</p>
                </div>
                <!-- 버튼 -->
                <div class="d-flex">
                    <button class="btn btn-outline-dark flex-shrink-0" type="button"
                            style="margin-right: 5px" onclick="location.href='/'">목록으로 돌아가기</button>
                    <button class="btn btn-outline-danger flex-shrink-0" type="button"
                            style="margin-right: 5px" onclick="location.href='/car/reserve?id=${getCar.id}'">예약하기</button>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Related items section-->
<section class="py-5 bg-light">
    <div class="container px-4 px-lg-5 mt-5">
        <h2 class="fw-bolder mb-4">Related products</h2>
        <div class="row gx-4 gx-lg-5 row-cols-2 row-cols-md-3 row-cols-xl-4 justify-content-center">
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Product image-->
                    <img class="card-img-top" src="https://picsum.photos/seed/789/450/300" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Fancy Product</h5>
                            <!-- Product price-->
                            $40.00 - $80.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">View options</a></div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                    <!-- Product image-->
                    <img class="card-img-top" src="https://picsum.photos/seed/456/450/300" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Special Item</h5>
                            <!-- Product reviews-->
                            <div class="d-flex justify-content-center small text-warning mb-2">
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                                <div class="bi-star-fill"></div>
                            </div>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">$20.00</span>
                            $18.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                    </div>
                </div>
            </div>
            <div class="col mb-5">
                <div class="card h-100">
                    <!-- Sale badge-->
                    <div class="badge bg-dark text-white position-absolute" style="top: 0.5rem; right: 0.5rem">Sale</div>
                    <!-- Product image-->
                    <img class="card-img-top" src="https://picsum.photos/seed/123/450/300" alt="..." />
                    <!-- Product details-->
                    <div class="card-body p-4">
                        <div class="text-center">
                            <!-- Product name-->
                            <h5 class="fw-bolder">Sale Item</h5>
                            <!-- Product price-->
                            <span class="text-muted text-decoration-line-through">$50.00</span>
                            $25.00
                        </div>
                    </div>
                    <!-- Product actions-->
                    <div class="card-footer p-4 pt-0 border-top-0 bg-transparent">
                        <div class="text-center"><a class="btn btn-outline-dark mt-auto" href="#">Add to cart</a></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>
<!-- Footer-->
<footer class="py-5 bg-dark">
    <div class="container"><p class="m-0 text-center text-white">Copyright &copy; Your Website 2022</p></div>
</footer>

<%@ include file="../bottom.jsp" %>
