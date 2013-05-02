<?php 
	$thisPage = 'index'; //Short name for page.
	$pageTitle = 'The Open Manual Format'; //Used in the <title> area.
	$color = 'aqua'; //Color choices: red, blue, aqua, yellow.
 ?>

<?php require_once('header.php') ?>
		
		<!--Featured-->
		<div id="featured">
			<div class="blackbox">
				<p>
				oManual is a simple, open XML-based standard for semantic, multimedia-rich procedural manuals.
				</p>
				<a href="standard.php" id="readbtn">Read the specification</a>
			</div>
		</div>
		<!--End Featured-->
		
		
		<div class="diagram">
			<p>
			Traditional procedural documents like service manuals don't meet the needs of modern applications. Documents need to incorporate multimedia and understand prerequisite dependencies. The <strong>oManual</strong> file format enables interoperability while allowing complete flexibility of presentation.
			</p>
		</div>
		
		<div class="colcont">
			<div class="col">
				<h3>For content producers:</h3>
				<ul>
					<li>Service manuals</li>
					<li>How-to guides</li>
					<li>Assembly instructions</li>
					<li>User manuals</li>
				</ul>
				<p>
				Standard interchange format. Convert from legacy document formats to oManual. Convert from oManual to PDF, OASIS, HTML, or even drop it into a relational database.
				</p>
			</div>
			
			<div class="col">
				<h3>For content users:</h3>
				<ul>
					<li>Dynamic web applications</li>
					<li>Presentation kiosks</li>
					<li>Service stations</li>
					<li>Mashups</li>
				</ul>
				<p>
				A consistent data format allows you to focus on what you're doing. Rather than burying a rare photo in masses of text, oManual puts the emphasis where it belongs: on the photos, with textual annotations.
				</p>
			</div>
		</div>
		
<?php require_once('footer.php') ?>


