<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
    <!-- Hero Section Begin -->
    <section class="hero">
        <div class="hero__slider owl-carousel">
            <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/hero/hero-outer.webp">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Best Sellers</h6>
                                <h2>Outers</h2>
                                <p>Outer Collection of Luxury Brands</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <div class="hero__items set-bg" data-setbg="${contextPath }/resources/bootstrap/img/hero/hero-2.jpg">
                <div class="container">
                    <div class="row">
                        <div class="col-xl-5 col-lg-7 col-md-8">
                            <div class="hero__text">
                                <h6>Summer Collection</h6>
                                <h2>Fall - Winter Collections 2030</h2>
                                <p>A specialist label creating luxury essentials. Ethically crafted with an unwavering
                                commitment to exceptional quality.</p>
                                <a href="#" class="primary-btn">Shop now <span class="arrow_right"></span></a>
                                <div class="hero__social">
                                    <a href="#"><i class="fa fa-facebook"></i></a>
                                    <a href="#"><i class="fa fa-twitter"></i></a>
                                    <a href="#"><i class="fa fa-pinterest"></i></a>
                                    <a href="#"><i class="fa fa-instagram"></i></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Hero Section End -->
	<br><br><br><br>
    <!-- Product Section Begin -->
    <section class="product spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <ul class="filter__controls">
                        <li class="active" data-filter="*">NewArrivals</li>
                        <li data-filter=".most-viewed">Most Viewed</li>
                        <li data-filter=".best-sellers">Best Sellers</li>
                        <li data-filter=".hot-sales">Hot Sales</li>
                    </ul>
                </div>
            </div>
            <div class="row product__filter">
            	<c:forEach var="bestSellerProduct" items="${bestSellerInfo }">
               		<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix best-sellers">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${bestSellerProduct.productFileName1 }">
		                        <span class="label">New</span>
	                            <ul class="product__hover">
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/heart.png" alt=""></a></li>
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/search.png" alt=""></a></li>
	                            </ul>
                        	</div>
	                        <div class="product__item__text">
	                        	<div>${bestSellerProduct.brand }</div>
	                            <div><a href="${contextPath }/product/productDetail?productCd=${bestSellerProduct.productCd}">${bestSellerProduct.productNm }</a></div>
	                            <div><a href="#">SELLER : ${bestSellerProduct.sellerNm }</a></div>
	                            <div class="product__price">$<span>${bestSellerProduct.price - bestSellerProduct.price * bestSellerProduct.discountRate / 100}</span> <span style="text-decoration: line-through; color: gray">$${bestSellerProduct.price }</span></div>
	                            <div><img src="${contextPath }/resources/bootstrap/img/icon/view.png" width=15px; height=17px; alt=""> : ${bestSellerProduct.views }&nbsp;
	                            <img src="${contextPath }/resources/bootstrap/img/icon/heart.png" width=15px; height=15px; alt=""> : ${bestSellerProduct.likes }</div>
	                        </div>
	                    </div>
	                </div>
                </c:forEach>
                <c:forEach var="mostViewedProduct" items="${mostViewedInfo }">
                	<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix most-viewed">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${mostViewedProduct.productFileName1 }">
		                        <span class="label">New</span>
	                            <ul class="product__hover">
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/heart.png" alt=""></a></li>
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/search.png" alt=""></a></li>
	                            </ul>
                        	</div>
	                        <div class="product__item__text">
	                        	<div>${mostViewedProduct.brand }</div>
	                            <div><a href="${contextPath }/product/productDetail?productCd=${mostViewedProduct.productCd}">${mostViewedProduct.productNm }</a></div>
	                            <div><a href="#">SELLER : ${mostViewedProduct.sellerNm }</a></div>
	                            <div class="product__price">$<span>${mostViewedProduct.price - mostViewedProduct.price * mostViewedProduct.discountRate / 100}</span> <span style="text-decoration: line-through; color: gray">$${mostViewedProduct.price }</span></div>
	                            <div><img src="${contextPath }/resources/bootstrap/img/icon/view.png" width=15px; height=17px; alt=""> : ${mostViewedProduct.views }&nbsp;
	                            <img src="${contextPath }/resources/bootstrap/img/icon/heart.png" width=15px; height=15px; alt=""> : ${mostViewedProduct.likes }</div>
	                        </div>
	                    </div>
                	</div>
                </c:forEach>
                <c:forEach var="newArrivalsProduct" items="${newArrivalsInfo }">
                	<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix new-arrivals">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${newArrivalsProduct.productFileName1 }">
		                        <span class="label">New</span>
	                            <ul class="product__hover">
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/heart.png" alt=""></a></li>
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/search.png" alt=""></a></li>
	                            </ul>
                        	</div>
	                        <div class="product__item__text">
	                        	<div>${newArrivalsProduct.brand }</div>
	                            <div><a href="${contextPath }/product/productDetail?productCd=${newArrivalsProduct.productCd}">${newArrivalsProduct.productNm }</a></div>
	                            <div><a href="#">SELLER : ${newArrivalsProduct.sellerNm }</a></div>
	                            <div class="product__price">$<span>${newArrivalsProduct.price - newArrivalsProduct.price * newArrivalsProduct.discountRate / 100}</span> <span style="text-decoration: line-through; color: gray">$${newArrivalsProduct.price }</span></div>
	                            <div><img src="${contextPath }/resources/bootstrap/img/icon/view.png" width=15px; height=17px; alt=""> : ${newArrivalsProduct.views }&nbsp;
	                            <img src="${contextPath }/resources/bootstrap/img/icon/heart.png" width=15px; height=15px; alt=""> : ${newArrivalsProduct.likes }</div>
	                        </div>
	                    </div>
                	</div>
                </c:forEach>
                <c:forEach var="hotSalesProduct" items="${hotSalesInfo }">
                	<div class="col-lg-3 col-md-6 col-sm-6 col-md-6 col-sm-6 mix hot-sales">
	                    <div class="product__item">
	                        <div class="product__item__pic set-bg" data-setbg="${contextPath }/thumbnails?productFileName1=${hotSalesProduct.productFileName1 }">
		                        <span class="label">New</span>
	                            <ul class="product__hover">
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/heart.png" alt=""></a></li>
	                                <li><a href="#"><img src="${contextPath }/resources/bootstrap/img/icon/search.png" alt=""></a></li>
	                            </ul>
                        	</div>
	                        <div class="product__item__text">
	                        	<div>${hotSalesProduct.brand }</div>
	                            <div><a href="${contextPath }/product/productDetail?productCd=${hotSalesProduct.productCd}">${hotSalesProduct.productNm }</a></div>
	                            <div><a href="#">SELLER : ${hotSalesProduct.sellerNm }</a></div>
	                            <div class="product__price">$<span>${hotSalesProduct.price - hotSalesProduct.price * hotSalesProduct.discountRate / 100}</span> <span style="text-decoration: line-through; color: gray">$${hotSalesProduct.price }</span></div>
	                            <div><img src="${contextPath }/resources/bootstrap/img/icon/view.png" width=15px; height=17px; alt=""> : ${hotSalesProduct.views }&nbsp;
	                            <img src="${contextPath }/resources/bootstrap/img/icon/heart.png" width=15px; height=15px; alt=""> : ${hotSalesProduct.likes }</div>
	                        </div>
	                    </div>
                	</div>
                </c:forEach>
            </div>
        </div>
    </section>
    <!-- Product Section End -->
    
        <!-- Banner Section Begin -->
    <section class="banner spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-7 offset-lg-4">
                    <div class="banner__item">
                        <div class="banner__item__pic">
                            <img src="${contextPath }/resources/bootstrap/img/banner/banner-1.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Clothing Collections 2030</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-5">
                    <div class="banner__item banner__item--middle">
                        <div class="banner__item__pic">
                            <img src="${contextPath }/resources/bootstrap/img/banner/banner-2.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Accessories</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="banner__item banner__item--last">
                        <div class="banner__item__pic">
                            <img src="${contextPath }/resources/bootstrap/img/banner/banner-3.jpg" alt="">
                        </div>
                        <div class="banner__item__text">
                            <h2>Shoes Spring 2030</h2>
                            <a href="#">Shop now</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Banner Section End -->

    <!-- Categories Section Begin -->
    <section class="categories spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-3">
                    <div class="categories__text">
                        <h2>Clothings Hot <br /> <span>Shoe Collection</span> <br /> Accessories</h2>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="categories__hot__deal">
                        <img src="${contextPath }/resources/bootstrap/img/product-sale.png" alt="">
                        <div class="hot__deal__sticker">
                            <span>Sale Of</span>
                            <h5>$29.99</h5>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 offset-lg-1">
                    <div class="categories__deal__countdown">
                        <span>Deal Of The Week</span>
                        <h2>Multi-pocket Chest Bag Black</h2>
                        <div class="categories__deal__countdown__timer" id="countdown">
                            <div class="cd-item">
                                <span>3</span>
                                <p>Days</p>
                            </div>
                            <div class="cd-item">
                                <span>1</span>
                                <p>Hours</p>
                            </div>
                            <div class="cd-item">
                                <span>50</span>
                                <p>Minutes</p>
                            </div>
                            <div class="cd-item">
                                <span>18</span>
                                <p>Seconds</p>
                            </div>
                        </div>
                        <a href="#" class="primary-btn">Shop now</a>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Categories Section End -->

    <!-- Instagram Section Begin -->
    <section class="instagram spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-8">
                    <div class="instagram__pic">
                        <div class="instagram__pic__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/instagram/instagram-1.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/instagram/instagram-2.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/instagram/instagram-3.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/instagram/instagram-4.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/instagram/instagram-5.jpg"></div>
                        <div class="instagram__pic__item set-bg" data-setbg="${contextPath }/resources/bootstrap/img/instagram/instagram-6.jpg"></div>
                    </div>
                </div>
                <div class="col-lg-4">
                    <div class="instagram__text">
                        <h2>Instagram</h2>
                        <p>Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut
                        labore et dolore magna aliqua.</p>
                        <h3>#Male_Fashion</h3>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Instagram Section End -->

    <!-- Latest Blog Section Begin -->
    <section class="latest spad">
        <div class="container">
            <div class="row">
                <div class="col-lg-12">
                    <div class="section-title">
                        <span>Latest News</span>
                        <h2>Fashion New Trends</h2>
                    </div>
                </div>
            </div>
            <div class="row">
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${contextPath }/resources/bootstrap/img/blog/blog-1.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="${contextPath }/resources/bootstrap/img/icon/calendar.png" alt=""> 16 February 2020</span>
                            <h5>What Curling Irons Are The Best Ones</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${contextPath }/resources/bootstrap/img/blog/blog-2.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="${contextPath }/resources/bootstrap/img/icon/calendar.png" alt=""> 21 February 2020</span>
                            <h5>Eternity Bands Do Last Forever</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
                <div class="col-lg-4 col-md-6 col-sm-6">
                    <div class="blog__item">
                        <div class="blog__item__pic set-bg" data-setbg="${contextPath }/resources/bootstrap/img/blog/blog-3.jpg"></div>
                        <div class="blog__item__text">
                            <span><img src="${contextPath }/resources/bootstrap/img/icon/calendar.png" alt=""> 28 February 2020</span>
                            <h5>The Health Benefits Of Sunglasses</h5>
                            <a href="#">Read More</a>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Latest Blog Section End -->
</body>
</html>