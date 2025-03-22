<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Mega City Cab</title>
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;600&display=swap" rel="stylesheet">
    <!-- Add Font Awesome CDN for icons -->
	<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            background: url('${pageContext.request.contextPath}/images/background1.jpg') no-repeat center center fixed;
            background-size: cover;
            position: relative;
        }
 

        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.5);
            z-index: -1;
        }

        header {
            background-color: rgba(51, 51, 51, 0.8);
            color: white;
            padding: 20px;
            text-align: center;
        }

        nav ul {
            list-style: none;
            padding: 0;
            text-align: center;
        }

        nav ul li {
            display: inline;
            margin: 0 15px;
        }

        nav ul li a {
            color: white;
            text-decoration: none;
        }

        .hero-container {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 50px;
            position: relative;
        }

        .hero-text {
            max-width: 50%;
            text-align: center;
            color: white;
        }

        .hero-text h1 {
            font-size: 80px;
            font-family: Arial, sans-serif;
        }

        .hero-text p {
            font-size: 20px;
            color: lightgray;
        }

        .hero-text .btn {
            background-color: black;
            color: white;
            padding: 10px 20px;
            text-decoration: none;
            border-radius: 5px;
            display: inline-block;
            margin-top: 10px;
        }
        
        

        .cards-container {
            display: flex;
            flex-direction: row; 
            align-items: center;
            justify-content: space-around;
            gap: 20px;
            padding: 20px;
            flex-wrap: wrap;
        }

        .card {
            background: rgba(255, 255, 255, 0.2);
            padding: 50px;
            border-radius: 50px;
            text-align: center;
            color: white;
            width: 50%;
            min-width: 200px;
        }
        .cookie-banner {
            position: fixed;
            bottom: 0;
            left: 0;
            width: 100%;
            background-color: black;
            color: white;
            padding: 15px;
            text-align: center;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .cookie-banner button {
            background: #f39c12;
            color: white;
            border: none;
            padding: 10px 20px;
            cursor: pointer;
            border-radius: 5px;
            margin-right: 40px;
        }
        .cookie-banner button:hover {
            background: #e67e22;
        }
        
       
        .service-items-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
            gap: 20px;
        }

        #services {
            padding: 50px;
            text-align: center;
            color: white;
        }

        .service-items-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .service-item {
            background: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .service-item h3 {
            font-size: 22px;
            margin-bottom: 10px;
            color: white;
        }

        .service-item p {
            font-size: 16px;
            color: lightgray;
            margin-bottom: 10px;
        }

        .service-item img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .service-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        #review {
            text-align: center;
            padding: 40px;
            color: white;
        }

        #contact {
            padding: 50px;
            text-align: center;
            color: white;
        }

        #contact form {
            display: flex;
            flex-direction: column;
            align-items: center;
            gap: 10px;
        }

        form input, form textarea {
            width: 50%;
            padding: 10px;
            margin: 10px 0;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        
footer {
    background-color: #333;
    color: white;
    padding: 40px 20px;
    text-align: center;
    box-shadow: 0 -2px 10px rgba(0, 0, 0, 0.1);
}

.footer-content {
    display: flex;
    flex-wrap: wrap;
    justify-content: space-between;
    gap: 30px;
    margin-bottom: 30px;
    max-width: 1200px;
    margin-left: auto;
    margin-right: auto;
}

.contact-info, .footer-middle, .social-media {
    flex: 1;
    min-width: 250px;
    padding: 10px;
}

.contact-info h3, .social-media h3 {
    font-size: 20px;
    margin-bottom: 10px;
    text-transform: uppercase;
    font-weight: bold;
}

.contact-info p {
    font-size: 16px;
    margin: 10px 0; /* Increased margin for better spacing */
    display: block; /* Ensure each <p> is on a new line */
}

.contact-info i {
    margin-right: 10px;
    color: white; /* Icon color */
}

.social-media a {
    display: inline-block;
    color: white;
    text-decoration: none;
    margin-bottom: 8px;
    font-size: 18px;
}

.social-media a:hover {
    color: #f1c40f;
    transform: scale(1.05);
}

.social-media i {
    margin-right: 10px;
}

.footer-text {
    font-size: 14px;
    opacity: 0.7;
    margin-top: 20px;
    font-family: 'Arial', sans-serif;
    line-height: 1.6;
}

.footer-text a {
    color: white;
    text-decoration: none;
}

.footer-text a:hover {
    color: #f1c40f;
}

.download-buttons {
    display: flex;
    justify-content: center;
    gap: 15px;
    margin-top: 20px;
}

.store-badge {
    width: 150px;
    transition: transform 0.3s ease;
}

.store-badge:hover {
    transform: scale(1.1);
}

@media (max-width: 768px) {
    .footer-content {
        flex-direction: column;
        align-items: center;
    }

    .contact-info, .footer-middle, .social-media {
        min-width: 100%;
        text-align: center;
    }

    .download-buttons {
        flex-direction: column;
    }
}

@media (max-width: 768px) {
    .footer-content {
        flex-direction: column;
        align-items: center;
    }

    .contact-info, .footer-middle, .social-media {
        min-width: 100%;
        text-align: center;
    }

    .download-buttons {
        flex-direction: column;
    }
}
@media (max-width: 768px) {
    .footer-content {
        flex-direction: column;
        align-items: center;
    }

    .contact-info, .social-media {
        min-width: 100%;
        text-align: center;
    }
}
        .download-buttons {
            display: flex;
            justify-content: flex-end; /* Aligns icons to the right */
            gap: 15px;
            margin-top: 10px;
            padding-right: 20px; /* Adjust spacing from the right */
        }
        .store-badge {
            height: 40px; /* Reduced size */
            width: auto;
            transition: transform 0.3s ease;
        }
        .store-badge:hover {
            transform: scale(1.1);
        }
        .footer-text {
            margin-top: 20px; /* Moves text down */
        }
        
        
        }

        /* About Us Section - Image on Left */
        #about {
            display: flex;
            align-items: center;
            text-align: left;
            gap: 20px;
            line-height: 1.8;
            word-spacing: 5px;
            margin-bottom: 20px;
        }

        #about img {
            width: 300px;
            height: auto;
            border-radius: 20px;
            flex-shrink: 0;
        }

        #about p {
            margin-bottom: 20px;
        }

        /* Customer Reviews Section */
        #review {
            text-align: center;
            padding: 40px;
            color: white;
        }

        .review-container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            gap: 20px;
        }

        .review-item {
            background: rgba(255, 255, 255, 0.2);
            padding: 30px;
            border-radius: 10px;
            width: 250px;
            text-align: center;
            box-shadow: 0 5px 15px rgba(0, 0, 0, 0.2);
            transition: transform 0.3s ease;
        }

        .review-item h4 {
            margin-top: 10px;
            font-size: 18px;
            color: black;
        }

        .review-item p {
            font-size: 16px;
            color: lightgray;
            margin-bottom: 10px;
        }

        .review-item img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            margin-bottom: 10px;
        }

        .review-item:hover {
            transform: translateY(-10px);
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.3);
        }

        /* Location Section */
        #location {
            
            padding: 50px;
            text-align: center;
            color: white;
        }

        #location h2 {
            font-size: 36px;
            margin-bottom: 20px;
        }

        #location p {
            font-size: 20px;
            margin-bottom: 20px;
        }

        #location .map-container {
            width: 80%;
            margin: 0 auto;
        }
        
   .app-detail {
      
        color: white;
        text-align: center;
        padding: 40px 0;
    }

    .app-icon i {
        font-size: 50px;
        color: blue;
        background-color: white;
        padding: 20px;
        border-radius: 50%;
    }

    h2 {
        font-weight: bold;
        margin: 10px 0;
    }

    .stats {
        display: flex;
        justify-content: center;
        gap: 15px;
        font-size: 18px;
    }

    .stats span {
        display: flex;
        align-items: center;
        gap: 5px;
    }

    .published-date {
        font-size: 14px;
        margin-top: 10px;
        opacity: 0.8;
    }
        /* Mobile-responsive */
        @media (max-width: 768px) {
            .service-items-container {
                flex-direction: column;
                align-items: center;
            }

            .service-item {
                width: 80%;
                margin-bottom: 20px;
            }

            .hero-container {
                flex-direction: column;
                padding: 20px;
            }

            .hero-image {
                width: 100%;
                margin: 0;
            }

            .hero-text h1 {
                font-size: 50px;
            }

    </style>
</head>
<body>


    <header>
    <nav>
        <ul>
        <li><a href="#home">Home</a></li>
        <li><a href="#about">About</a></li>
        <li><a href="#services">Services</a></li>
        <li><a href="contact.jsp">Contact</a></li>
        <li><a href="#review">Customer Review</a></li>
        <li><a href="#location">Location</a></li>
        <li><a href="SelectCar.jsp">Book a Ride</a></li> <!-- Updated this link -->
        <li><a href="Help.jsp">Help</a></li>
        <li><a href="LogOut.jsp">LogOut</a></li>
        </ul>
    </nav>
</header>

    <!-- Cookie Consent Banner -->
    <div class="cookie-banner" id="cookieBanner">
        <p>We use cookies to enhance your experience. By continuing to visit this site, you agree to our use of cookies.</p>
        <button onclick="acceptCookies()">Accept</button>
    </div>

    <script>
        function acceptCookies() {
            document.getElementById('cookieBanner').style.display = 'none';
            localStorage.setItem('cookieAccepted', 'true');
        }

        window.onload = function() {
            if (localStorage.getItem('cookieAccepted')) {
                document.getElementById('cookieBanner').style.display = 'none';
            }
        }
    </script>
    
    <section class="hero-container">
        <div class="hero-text">
            <h1>Mega City Cab</h1>
            <p>Reliable and Fast Cab Service in Colombo. Thousands of satisfied customers trust us for safe and comfortable rides.</p>
           
    </section>
    

    <div class="cards-container">
        <!-- About Us Section -->
        <section id="about" class="card">
            
            <div>
                <h2>About Us</h2>
                <p>Welcome to Mega City Cab, Colombo's trusted and efficient cab service provider. With thousands of customers relying on us each month, we are committed to offering safe, reliable, and comfortable rides across the city.</p>
                <p>At Mega City Cab, we continuously strive to enhance customer experience by adopting innovative solutions. To streamline our operations and improve efficiency, we are transitioning to a computerized booking and management system. This new system will simplify customer bookings, manage driver and vehicle details, and ensure seamless billing, making your rides smoother than ever.</p>
            </div>
        </section>

        <!-- Our Services Section -->
        <section id="services">
            <h2>Our Services</h2>
            <div class="service-items-container">
                <div class="service-item">
                    <img src="${pageContext.request.contextPath}/images/OIP (3).jpeg" alt="City Rides">
                    <div class="service-info">
                        <h3>City Rides</h3>
                        <p>Experience fast and comfortable rides around the city.</p>
                    </div>
                </div>
                <div class="service-item">
                    <img src="${pageContext.request.contextPath}/images/OIP (4).jpeg" alt="Airport Transfers">
                    <div class="service-info">
                        <h3>Airport Transfers</h3>
                        <p>Reliable and on-time transfers to and from the airport.</p>
                    </div>
                </div>
                <div class="service-item">
                    <img src="${pageContext.request.contextPath}/images/call-bg-1024x615.webp" alt="Corporate Rides">
                    <div class="service-info">
                        <h3>Corporate Rides</h3>
                        <p>We offer tailored rides for corporate clients and events.</p>
                    </div>
                </div>
            </div>
        </section>
    </div>

   <!-- Customer Reviews Section -->
<section id="review">
    <div class="container">
        <h2 class="section-title">Customer Reviews</h2>
        <p class="section-subtitle">See what our customers say about us</p>
        
        <div class="review-container">
            <div class="review-item">
                <img src="${pageContext.request.contextPath}/images/OIP (2).jpeg" alt="Customer 1">
                <div class="review-content">
                    <p>"Great experience, the cab was clean, and the driver was friendly!"</p>
                    <div class="stars">
                        ★★★★★
                    </div>
                    <h4>John Doe</h4>
                </div>
            </div>
            
            <div class="review-item">
                <img src="${pageContext.request.contextPath}/images/teenage-girl-widely-smole-to-camera-38096932.webp" alt="Customer 2">
                <div class="review-content">
                    <p>"On-time service and comfortable ride, highly recommend!"</p>
                    <div class="stars">
                        ★★★★☆
                    </div>
                    <h4>Jane Smith</h4>
                </div>
            </div>
            
            <div class="review-item">
                <img src="${pageContext.request.contextPath}/images/shackets-data.jpg" alt="Customer 3">
                <div class="review-content">
                    <p>"Excellent customer service. I will definitely use Mega City Cab again!"</p>
                    <div class="stars">
                        ★★★★★
                    </div>
                    <h4>Mark Wilson</h4>
                </div>
            </div>
        </div>
    </div>
</section>

   


    <!-- Location Section -->
    <section id="location">
        <h2>Find Us</h2>
        <p>We are located in the heart of Colombo, making it easy for you to find us and book a cab at any time.</p>
        <div class="map-container">
            <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d126118.55425958116!2d79.9213259462666!3d6.9270782999999995!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3ae2592abf0f3179%3A0x774cdbad60ac2955!2sColombo!5e0!3m2!1sen!2slk!4v1610132552349!5m2!1sen!2slk" width="100%" height="450" frameborder="0" style="border:0;" allowfullscreen="" aria-hidden="false" tabindex="0"></iframe>
        </div>
    </section>
    
 <section class="app-detail container">
    <div class="app-details">
        <div class="app-icon">
            <i class="fa fa-thumbs-up"></i>
        </div>
        <h2>Cab Service App Landing Page | Hurryup Cabs</h2>
        <div class="stats">
            <span><i class="fa fa-thumbs-up"></i> <span id="likes-count">8</span></span>
            <span><i class="fa fa-eye"></i> <span id="views-count">112</span></span>
            <span><i class="fa fa-comment"></i> <span id="messages-count">2</span></span>
        </div>
        <p class="published-date">Published: June 23rd, 2021</p>
    </div>
</section>
    
<footer>
    <div class="footer-content">
        <div class="contact-info">
            <h3>Contact</h3>
            <p><i class="fas fa-map-marker-alt"></i> Colombo 05</p>
            <p><i class="fas fa-envelope"></i> Email: megacitycab@support.com</p>
            <p><i class="fas fa-phone"></i> Phone: (+94) 1123-4567</p>
            <p><i class="fas fa-clock"></i> Mon - Sat: 08:00 - 18:00</p>
            <p><i class="fas fa-clock"></i> Sun: 09:00 - 18:00</p>
        </div>
        <div class="footer-middle">
            <div class="footer-text">
                <p class="footer-text">&copy; 2025 Mega City Cab. All Rights Reserved.</p>
                <p><a href="#">Privacy Policy</a> | <a href="#">Terms Condition</a></p>
            </div>
            <div class="download-buttons">
            <a href="https://play.google.com/store/apps/details?id=your.app.id" target="_blank">
                <img src="https://upload.wikimedia.org/wikipedia/commons/7/78/Google_Play_Store_badge_EN.svg" alt="Get it on Google Play" class="store-badge">
            </a>
            <a href="https://apps.apple.com/app/idyourappid" target="_blank">
                <img src="https://developer.apple.com/assets/elements/badges/download-on-the-app-store.svg" alt="Download on the App Store" class="store-badge">
            </a>
        </div>

        </div>
        <div class="social-media">
            <h3>Follow Us</h3>
            <a href="#"><i class="fab fa-facebook-f"></i> Facebook</a>
            <a href="#"><i class="fab fa-twitter"></i> Twitter</a>
            <a href="#"><i class="fab fa-instagram"></i> Instagram</a>
        </div>
    </div>
</footer>
</body>
</html>
