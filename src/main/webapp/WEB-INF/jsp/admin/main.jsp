<!DOCTYPE html>
<html>
    <head>
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
        <title>Sentra HTML CSS Template</title>
        
<!-- 

Sentra Template

http://www.templatemo.com/tm-518-sentra

-->
        <meta name="description" content="">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <link rel="apple-touch-icon" href="apple-touch-icon.png">

        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/admin/css/bootstrap.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/admin/css/bootstrap-theme.min.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/admin/css/fontAwesome.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/admin/css/light-box.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/admin/css/owl-carousel.css">
        <link rel="stylesheet" href="${pageContext.request.contextPath}/resource/admin/css/templatemo-style.css">

        <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400,600,700,800" rel="stylesheet">

        <script src="${pageContext.request.contextPath}/resource/admin/js/vendor/modernizr-2.8.3-respond-1.4.2.min.js"></script>
    	<script>
    	$(function(){
			client = new Paho.MQTT.Client("192.168.3.163", 61614, new Date().getTime().toString());
			client.onMessageArrived = onMessageArrived;
			client.connect({onSuccess:onConnect});
		});
		/* 연결 완료 및 클라이언트 값 구독 */
		function onConnect() {
			client.subscribe("/camerapub");
		}
		function onMessageArrived(message) {
			if(message.destinationName == "/camerapub") {
				var cameraView = $("#cameraView1").attr(
						"src", "data:image/jpg;base64," + message.payloadString);
				
			}
    	
    	</script>
    
    </head>

<body>



        <!-- <header class="nav-down responsive-nav hidden-lg hidden-md">
            <button type="button" id="nav-toggle" class="navbar-toggle" data-toggle="collapse" data-target="#main-nav">
                <span class="sr-only">Toggle navigation</span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
                <span class="icon-bar"></span>
            </button>
            /.navbar-header
            <div id="main-nav" class="collapse navbar-collapse">
                <nav>
                    <ul class="nav navbar-nav">
                        <li><a href="#top">Home</a></li>
                        <li><a href="#featured">Featured</a></li>
                        <li><a href="#projects">Recent Projects</a></li>
                        <li><a href="#video">Presentation</a></li>
                        <li><a href="#blog">Blog Entries</a></li>
                        <li><a href="#contact">Contact Us</a></li>
                    </ul>
                </nav>
            </div>
        </header> -->

        <div class="sidebar-navigation hidde-sm hidden-xs">
            <div class="logo">
                <a href="#">Administrator</a>
            </div>
            <nav>
                <ul>
                    <li>
                        <a href="#top">
                            <span class="rect"></span>
                            <span class="circle"></span>
                            Home
                        </a>
                    </li>
                    <li>
                        <a href="#blog">
                            <span class="rect"></span>
                            <span class="circle"></span>
                            Car Control Center
                        </a>
                    </li>
                </ul>
            </nav>
        </div>

        <div class="slider">
            <div class="Modern-Slider content-section" id="top">
                <!-- Item -->
                <div class="item item-1">
                    <div class="img-fill">
                    <div class="image"></div>
                    <div class="info">
                        <div>
                          
                        </div>
                        </div>
                    </div>
                </div>
                <!-- // Item -->
                <!-- Item -->
                <div class="item item-2">
                    <div class="img-fill">
                        <div class="image"></div>
                        <div class="info">
                        <div>
                          
                        </div>
                        </div>
                    </div>
                </div>
                <!-- // Item -->
                <!-- Item -->
                <div class="item item-3">
                    <div class="img-fill">
                        <div class="image"></div>
                        <div class="info">
                        <div>
                          
                        </div>
                        </div>
                    </div>
                </div>
                <!-- // Item -->
            </div>
        </div>


        <div class="page-content">
            
            <section id="blog" class="content-section">
                <div class="section-heading">
                    <h1>Car <em>Control</em> Center</h1>
                </div>
                <div class="section-content">
                    <div class="tabs-content">
                        <div class="wrapper">
                            <ul class="tabs clearfix" data-tabgroup="first-tab-group">
                              <li><a href="#tab1" class="active">In Operation</a></li>
                              <li><a href="#tab2">In Delivery</a></li>
                              <li><a href="#tab3">Waiting</a></li>
                              <li><a href="#tab4">Under Repair</a></li>
                            </ul>
                            <section id="first-tab-group" class="tabgroup">
                   		        <!-- tab1 ################################################################################## -->
                                <div id="tab1">
                                    <ul>
                                        <li>
                                            <div class="item">
                                                <img id="cameraView1" alt="">
                                                <div class="text-content">
                                                    <h4>Car ID : 00001</h4>
                                                    <span>Registration Date : 2020.08.01</span>
                                                    <p>Nam vel egestas nisi. Nullam lobortis magna at enim venenatis luctus. Nam finibus, mauris eu dictum iaculis, dolor tortor cursus quam, in volutpat augue lectus sed magna. Integer mollis lorem quis ipsum maximus finibus.</p>
                                                    
                                                    <div class="accent-button button">
                                                        <a href="#contact">Control Car</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item">
                                                <img src="${pageContext.request.contextPath}/resource/admin/img/blog_2.jpg" alt="">
                                                <div class="text-content">
                                                    <h4>Car ID : 00004</h4>
                                                    <span>Registration Date : 2020.08.04</span>
                                                    <p>Nam vel egestas nisi. Nullam lobortis magna at enim venenatis luctus. Nam finibus, mauris eu dictum iaculis, dolor tortor cursus quam, in volutpat augue lectus sed magna. Integer mollis lorem quis ipsum maximus finibus.</p>
                                                    
                                                    <div class="accent-button button">
                                                        <a href="#contact">Control Car</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item">
                                                <img src="${pageContext.request.contextPath}/resource/admin/img/blog_3.jpg" alt="">
                                                <div class="text-content">
                                                    <h4>Car ID : 00005</h4>
                                                    <span>Registration Date : 2020.08.05</span>
                                                    <p>Nam vel egestas nisi. Nullam lobortis magna at enim venenatis luctus. Nam finibus, mauris eu dictum iaculis, dolor tortor cursus quam, in volutpat augue lectus sed magna. Integer mollis lorem quis ipsum maximus finibus.</p>
                                                    
                                                    <div class="accent-button button">
                                                        <a href="#contact">Control Car</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                <!-- tab2 ################################################################################## -->
                                <div id="tab2">
                                    <ul>
                                        <li>
                                            <div class="item">
                                                <img src="${pageContext.request.contextPath}/resource/admin/img/blog_3.jpg" alt="">
                                                <div class="text-content">
                                                    <h4>Car ID : 00002</h4>
                                                    <span>Registration Date : 2020.08.02</span>
                                                    <p>Nam vel egestas nisi. Nullam lobortis magna at enim venenatis luctus. Nam finibus, mauris eu dictum iaculis, dolor tortor cursus quam, in volutpat augue lectus sed magna. Integer mollis lorem quis ipsum maximus finibus.</p>
                                                    
                                                    <div class="accent-button button">
                                                        <a href="#contact">Control Car</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                        <li>
                                            <div class="item">
                                                <img src="${pageContext.request.contextPath}/resource/admin/img/blog_1.jpg" alt="">
                                                <div class="text-content">
                                                    <h4>Car ID : 00003</h4>
                                                    <span>Registration Date : 2020.08.03</span>
                                                    <p>Nam vel egestas nisi. Nullam lobortis magna at enim venenatis luctus. Nam finibus, mauris eu dictum iaculis, dolor tortor cursus quam, in volutpat augue lectus sed magna. Integer mollis lorem quis ipsum maximus finibus.</p>
                                                    
                                                    <div class="accent-button button">
                                                        <a href="#contact">Control Car</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <!-- tab3 ################################################################################## -->
                                <div id="tab3">
                                    <ul>
                                        <li>
                                            <div class="item">
                                                <img src="${pageContext.request.contextPath}/resource/admin/img/blog_2.jpg" alt="">
                                                <div class="text-content">
                                                    <h4>Car ID : 00007</h4>
                                                    <span>Registration Date : 2020.08.07</span>
                                                    <p>Nam vel egestas nisi. Nullam lobortis magna at enim venenatis luctus. Nam finibus, mauris eu dictum iaculis, dolor tortor cursus quam, in volutpat augue lectus sed magna. Integer mollis lorem quis ipsum maximus finibus.</p>
                                                    
                                                    <div class="accent-button button">
                                                        <a href="#contact">Control Car</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>
                                    </ul>
                                </div>
                                
                                <!-- tab4 ################################################################################## -->
                                <div id="tab4">
                                    <ul>
                                        <li>
                                            <div class="item">
                                                <img src="${pageContext.request.contextPath}/resource/admin/img/blog_1.jpg" alt="">
                                                <div class="text-content">
                                                    <h4>Car ID : 00006</h4>
                                                    <span>Registration Date : 2020.08.06</span>
                                                    <p>Nam vel egestas nisi. Nullam lobortis magna at enim venenatis luctus. Nam finibus, mauris eu dictum iaculis, dolor tortor cursus quam, in volutpat augue lectus sed magna. Integer mollis lorem quis ipsum maximus finibus.</p>
                                                    
                                                    <div class="accent-button button">
                                                        <a href="#contact">Control Car</a>
                                                    </div>
                                                </div>
                                            </div>
                                        </li>                                
                                    </ul>
                                </div>
                            </section> 
                        </div>
                    </div>
                </div>
            </section>
            <section class="footer">
                <p>Copyright &copy; 2018. Design: <a href="http://templatemo.com/tm-518-sentra" target="_blank">Sentra</a> | Distribution: <a href="https://themewagon.com" target="_blank">ThemeWagon</a></p>
            </section>
        </div>



    <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.2/jquery.min.js"></script>
    <script>window.jQuery || document.write('<script src="js/vendor/jquery-1.11.2.min.js"><\/script>')</script>

    <script src="${pageContext.request.contextPath}/resource/admin/js/vendor/bootstrap.min.js"></script>
    
    <script src="${pageContext.request.contextPath}/resource/admin/js/plugins.js"></script>
    <script src="${pageContext.request.contextPath}/resource/admin/js/main.js"></script>

    <script>
        // Hide Header on on scroll down
        var didScroll;
        var lastScrollTop = 0;
        var delta = 5;
        var navbarHeight = $('header').outerHeight();

        $(window).scroll(function(event){
            didScroll = true;
        });

        setInterval(function() {
            if (didScroll) {
                hasScrolled();
                didScroll = false;
            }
        }, 250);

        function hasScrolled() {
            var st = $(this).scrollTop();
            
            // Make sure they scroll more than delta
            if(Math.abs(lastScrollTop - st) <= delta)
                return;
            
            // If they scrolled down and are past the navbar, add class .nav-up.
            // This is necessary so you never see what is "behind" the navbar.
            if (st > lastScrollTop && st > navbarHeight){
                // Scroll Down
                $('header').removeClass('nav-down').addClass('nav-up');
            } else {
                // Scroll Up
                if(st + $(window).height() < $(document).height()) {
                    $('header').removeClass('nav-up').addClass('nav-down');
                }
            }
            
            lastScrollTop = st;
        }
    </script>

    <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js" type="text/javascript"></script>

</body>
</html>