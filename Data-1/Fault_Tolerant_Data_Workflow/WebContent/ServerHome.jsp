<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Server | Home</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    

    <!-- google fonts cdn link  -->
    <link rel="preconnect" href="https://fonts.gstatic.com">
    <link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@300;400;600&display=swap" rel="stylesheet">

    <!-- font awesome cdn link  -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <!-- custom css file link  -->
    <link rel="stylesheet" href="css/style.css">

</head>
<body>


<!-- heading section starts  -->

<header>

    <a href="#" class="logo"><i class="fas fa-headphones"></i> Fault Tolerant and Data Workflows Management</a>

    <div id="menu" class="fas fa-bars"></div>

    <nav class="navbar">
        <ul>
            <li><a class="active" href="ServerHome.jsp">home</a></li>
            <li><a href="FileUpload.jsp">Commercial Data</a></li>
            <li><a href="ServerData.jsp">Server_Data</a></li>
            <li><a href="Blockchain.jsp">BlockChain</a></li>
            <li><a href="LoginDetails.jsp">Users_Details</a></li>
            <li><a href="UserBlockchain.jsp">User BlockChain</a></li>
            <li><a href="Index.html">Logout</a></li>
           <!-- <li><a href="#faq">FAQ</a></li>  -->
        </ul>
    </nav>

</header>

<!-- heading section ends -->

<!-- home section starts  -->

<section class="home" id="home">

    <div class="content">
        <h1>Fault Tolerant and Data Workflows Management</h1>
        <p>Scheduling System in Cloud Computing.</p>
        <a href="#"><button class="btn">Fault Tolerant and Data</button></a>
    </div>

    <div class="image">
        <img src="images/hero-img.png" alt="">
    </div>

</section>

<!-- home section ends -->

<!-- about section starts  -->
<!--
<section class="about" id="about">

    <div class="image">
        <img src="images/about-img.png" alt="">
    </div>

    <div class="content">
        <h1 class="heading">about product</h1>
        <h3>change your life with our high quality products</h3>
        <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Delectus laborum quia, ducimus vel consequatur consequuntur perferendis necessitatibus obcaecati quos quis.</p>
        <ul>
            <li> <i class="fas fa-check-double"></i> wireless facility </li>
            <li> <i class="fas fa-check-double"></i> high quality sounds </li>
            <li> <i class="fas fa-check-double"></i> voice call facility </li>
            <li> <i class="fas fa-check-double"></i> nice and soft design </li>
        </ul>
    </div>

</section>

<!-- about section ends -->

<!-- features section starts  -->
<!--
<section class="features" id="features">

<h1 class="heading">product features</h1>

<h1 class="title">new and outstanding features</h1>

<p class="description">Lorem ipsum dolor, sit amet consectetur adipisicing elit. Eveniet molestiae repellat labore possimus velit ex aperiam sequi atque veniam consectetur.</p>

<div class="box-container">

    <div class="box">
        <i class="fas fa-wifi"></i>
        <h3>wireless facility</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus asperiores neque facere magni fugiat labore ipsum provident sed numquam.</p>
    </div>

    <div class="box">
        <i class="fas fa-music"></i>
        <h3>high quality sound</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus asperiores neque facere magni fugiat labore ipsum provident sed numquam.</p>
    </div>

    <div class="box">
        <i class="fas fa-gamepad"></i>
        <h3>easy control buttons</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus asperiores neque facere magni fugiat labore ipsum provident sed numquam.</p>
    </div>

    <div class="box">
        <i class="fas fa-headset"></i>
        <h3>24 x 7 service</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Corrupti doloribus asperiores neque facere magni fugiat labore ipsum provident sed numquam.</p>
    </div>

</div>

</section>

<!-- features section ends -->

<!-- Product section starts  -->
<!--
<section class="product" id="product">

<h1 class="heading">products</h1>

<h1 class="title">affordable products at greate price</h1>

<div class="box-container">

    <div class="box">
        <h3>new headphones</h3>
        <img src="images/product-1.png" alt="">
        <span class="price">$50/-</span>
        <a href="#"><button class="btn">buy now</button></a>
    </div>

    <div class="box">
        <h3>new headphones</h3>
        <img src="images/product-2.png" alt="">
        <span class="price">$40/-</span>
        <a href="#"><button class="btn">buy now</button></a>
    </div>

    <div class="box">
        <h3>new headphones</h3>
        <img src="images/product-3.png" alt="">
        <span class="price">$60/-</span>
        <a href="#"><button class="btn">buy now</button></a>
    </div>

    <div class="box">
        <h3>new headphones</h3>
        <img src="images/product-4.png" alt="">
        <span class="price">$55/-</span>
        <a href="#"><button class="btn">buy now</button></a>
    </div>

</div>

</section>

<!-- Product section ends -->

<!-- contact section starts  -->
<!--
<section class="contact" id="contact">

<h1 class="heading">contact</h1>

<h1 class="title">contact us for latest updates</h1>

<form action="">

    <div class="inputBox">
        <input type="text" placeholder="first name">
        <input type="text" placeholder="last name">
    </div>

    <div class="inputBox">
        <input type="email" placeholder="your email">
        <input type="password" placeholder="your password">
    </div>

    <textarea name="" id="" cols="30" rows="10" placeholder="message"></textarea>

    <input type="submit" value="message" class="btn">

</form>

</section>

<!-- contact section ends -->

<!-- faq section starts  -->
<!--
<section class="faq" id="faq">

<h1 class="heading">FAQ</h1>

<h1 class="title">what people asks from us</h1>

<div class="row">

    <div class="image">
        <img src="images/faq-img.svg" alt="">
    </div>

    <div class="accordion-container">

        <div class="accordion">
            <h1 class="accordion-heading">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, animi!
            </h1>
            <p class="accordion-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium ipsam, fuga sit nostrum minus culpa cumque veniam earum facilis architecto.
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos, cupiditate.
            </p>
        </div>

        <div class="accordion">
            <h1 class="accordion-heading">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, animi!
            </h1>
            <p class="accordion-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium ipsam, fuga sit nostrum minus culpa cumque veniam earum facilis architecto.
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos, cupiditate.
            </p>
        </div>

        <div class="accordion">
            <h1 class="accordion-heading">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, animi!
            </h1>
            <p class="accordion-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium ipsam, fuga sit nostrum minus culpa cumque veniam earum facilis architecto.
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos, cupiditate.
            </p>
        </div>

        <div class="accordion">
            <h1 class="accordion-heading">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, animi!
            </h1>
            <p class="accordion-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium ipsam, fuga sit nostrum minus culpa cumque veniam earum facilis architecto.
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos, cupiditate.
            </p>
        </div>

        <div class="accordion">
            <h1 class="accordion-heading">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Dolor, animi!
            </h1>
            <p class="accordion-content">
                Lorem ipsum dolor sit amet consectetur adipisicing elit. Praesentium ipsam, fuga sit nostrum minus culpa cumque veniam earum facilis architecto.
                Lorem ipsum dolor sit amet consectetur, adipisicing elit. Quos, cupiditate.
            </p>
        </div>

    </div>

</div>

</section>

<!-- faq section ends -->

<!-- footer section starts  -->

<section class="footer">

<div class="box-container">

    <div class="box">
        <h3>why choose us?</h3>
        <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Autem libero ea repellendus aut commodi, sequi praesentium! Neque aliquam excepturi quas.</p>
    </div>

    <div class="box">
        <h3>quick links</h3>
        <a href="#">home</a>
        <a href="#">about</a>
        <a href="#">features</a>
        <a href="#">products</a>
        <a href="#">contact</a>
        <a href="#">FAQ</a>
    </div>

    <div class="box">
        <h3>contact us</h3>
        <p> <i class="fas fa-map-marker-alt"></i> Tamil nadu, india 400104. </p>
        <p> <i class="fas fa-globe"></i> www.FaultTolerantandData.com </p>
        <p> <i class="fas fa-phone"></i> +123-456-7890. </p>
    </div>

</div>

<h1 class="credit"> created by <a href="#">@2023</a> | all rights reserved. </h1>

</section>

<!-- footer section ends -->























<!-- jquery cdn link  -->
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- custom js file link  -->
<script src="js/main.js"></script>







</body>
</html>