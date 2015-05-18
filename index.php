<!--
Startpage, every other page gets loaded in.
-->
<!DOCTYPE html>
<html lang="de">
  <head>
    <?php require_once("resources/head.php"); ?>
  </head>
  <body>
    <div class="wrapper">
      <?php 
      		if (!empty($_GET['site']) && $_GET['site'] !== 'login' && $_GET['site'] !== 'register') {
      			require_once("resources/pageNavbar.php"); 
      		}else{
            require_once("resources/loginNavbar.php");
          }
      ?>

      <?php require_once("resources/pageHeader.php"); ?>

      <div class="container content">

    	<?php
    		// Get page folder and set default page
    		$pagefolder = 'sites/';
    		$defaultpage = 'login';

    		if (!empty($_GET['site'])) {	// Check if there is a site
    			$page = $_GET["site"];
    		} else {
    			$page = $defaultpage;
    		}

    		if (!file_exists($pagefolder . $page .".php")) {
                $page = $defaultpage.".php";
            }

            // Get content
            include $pagefolder . basename($page.".php");
      ?>

      </div>
      <?php require_once("resources/footer.php"); ?>
    </div>
  </body>
</html>