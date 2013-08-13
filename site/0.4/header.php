<!DOCTYPE html>
<html lang="en">

	<head>
		<title>oManual: <?php echo $pageTitle; ?></title>
		<meta http-equiv="Content-Type" content="text/html;charset=utf-8" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" type="text/css" href="assets/reset.css" />
		<link rel="stylesheet" type="text/css" href="assets/style.css" />
      <?php if ($thisPage == 'standard'): ?>
		<link rel="stylesheet" type="text/css" href="assets/syntax.css" />
      <? endif ?>

      <script type="text/javascript">
         var _gaq = _gaq || [];
         _gaq.push(['_setAccount', 'UA-30506-13']);
         _gaq.push(['_trackPageview']);
         _gaq.push(['_trackPageLoadTime']);
         (function() {
            var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
            ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
            var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
         })();
      </script>
				
	</head>

	<body class="<?php echo $color; ?>">

		<!--Header-->
		<div id="header">
			<div id="hcont">
				<a href="index.php">
					<div id="toplogo">
						<div class="ospin"></div>
						<h1>oManual: The Open Manual Format</h1>
					</div>
				</a>
				<ul class="navbar">
					<li><a href="documentation.php" <?php if ($thisPage == 'documentation') echo('class="active"') ?>>Documentation</a></li>
					<li><a href="standard.php" <?php if ($thisPage == 'standard') echo('class="active"') ?>>Proposed Standard</a></li>
					<li><a href="about.php" <?php if ($thisPage == 'about') echo('class="active"') ?>>About</a></li>
				</ul>
			</div>
		</div>
		<!--End Header-->
