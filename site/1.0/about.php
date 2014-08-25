<?php 
	$thisPage = 'about'; //Short name for page.
	$pageTitle = 'About oManual'; //Used in the <title> area.
	$color = 'blue'; //Color choices: red, blue, aqua, yellow.
 ?>

<?php require_once('header.php') ?>
		
		<div class="intcontent">
		
			<h2>About oManual</h2>
			
			<h3>Introduction</h3>
			
			<p>
			A little bit of history. Manuals have always included images, parts diagrams, and references to other documents. Those links and metadata are a significant part of what makes a manual effective. The internet is perfect for making these documents come alive, making it possible to connect procedures with tools and reference specifications.
			Unfortunately, the vast majority of manuals distributed online don't take advantage of this flexibility. PDF documents are static, have no structure to their data.
			</p>
			
			<p>
			A huge amount of useful data is buried, trapped in static documents where it cannot be leveraged, built upon, and repurposed.
			</p>
			
			<p>
			oManual is an XML&mdash;based data standard that solves this problem. Publishing manuals as both user&mdash;friendly PDF / HTML and machine&mdash;friendly oManual files allows for the best of both worlds: manuals that retain their ease of use, but are also easy to maintain and build upon.
			</p>
			
			<h3>How did oManual get started?</h3>
			
			<p>
			oManual started when <a href="http://oreilly.com">O'Reilly Media</a> (a leading publisher of technical books) and <a href="http://www.ifixit.com">iFixit</a>  (the free online repair manual) started searching for a data format to exchange their procedural manuals. Existing XML specifications were overly broad and convoluted, ill&mdash;suited for procedural manuals. So we created a specialized format to fill the gap.
			</p>
			
			<h3>Who is it for?</h3>
			
			<p>
         oManual is for anyone who wants to publish manuals, whether they are repair manuals, manuals to create things, manuals to destroy things, how&mdash;to guides, work instructions, or any other type of manual which contains step by step instructions. oManual is also for developers who want a flexible format that allows them to republish content in new and exciting
			ways. 
			</p>
			
			<h3>What exactly is a manual?</h3>
			
			<p>Manual is an &#8220;overloaded&#8221; word, and most dictionaries have outdated definitions referring to instruction books. Here's our definition: A manual is a document that teaches you how to do something. To pick a few examples, we think oManual is a good fit for reference manuals, instruction manuals, user manuals, owner's manuals, how&mdash;to manuals, survival guides, and service manuals &mdash; but that's just a start.</p>

         <h3>Why is oManual both a file format and an API specification?</h3>

         <p>
         Traditional documentation&mdash;PDFs, Word documents, and even complex files like DITA—lives on a single computer. Establishing a 'single source of truth' for these documents requires complex document management systems. Accessing these (often very large) documents from a mobile device can be challenging, because it requires downloading the entire file up front.
         </p>

         <p>
         Mobile applications usually download information as they need it, from an on&mdash;demand API. oManual bridges these two worlds by providing a common data format, and allowing the information to be transmitted via legacy offline files or made available as a web service. An example workflow would be to take XML DITA service manuals, convert them to oManual with an XSLT transform, then load them onto a JSON server for use by mobile applications.
         </p>
			
			<h3>Is oManual compatible with DITA?</h3>
			
         <p>oManual is not a subset of <a href="http://en.wikipedia.org/wiki/Darwin_Information_Typing_Architecture">DITA</a>, but it is straightforward to convert from oManual to DITA, or from DITA to oManual.</p> 
         <p>Don Day, the Founding Char of the DITA Technical Committee and DITA Expert, wrote a <a href="https://github.com/oManual/dita-to-omanual">dita-to-omanual converter</a> to bring your DITA documents over to oManual.  One note of caution: 'round&mdash;tripping' content from DITA to oManual and back again is not recommended, because oManual does not fully support all of DITA. This simplicity of oManual is a feature, not a bug.</p>

         <h3>What software supports oManual?</h3>

         <p>As of right now, Dozuki is the only software platform that can read and write oManual packages. We are working with a number of companies to get this standard implemented as part of their software platforms, such as <a href="http://xmetal.com/content-xmetal-author/">XMetaL</a> and <a href="http://www.oxygenxml.com/">Oxygen XML</a>.</p>

         <p>iFixit has released open source apps that implement oManual's JSON API for <a href="https://github.com/iFixit/iFixitAndroid">Android</a>, <a href="https://github.com/iFixit/iFixit-iOS">iOS</a>, as well as <a href="https://github.com/iFixit/ifixit-microsoft">Windows 8 and Phone 8</a>.</p>

			<h3>Can I help?</h3>
			
			<p>
			Absolutely. We will be expanding the standard as needed. Our driving principles:
			</p>
			
			<ol>
				<li><span>The format should be as simple as possible, and no simpler.</span></li>
				<li><span>No manual stands alone. oManual should enable prerequisite chaining and semantic linking, referencing external documents as much as possible.</span></li>
				<li><span>Manuals are not simply text. They are dynamic documents that encapsulate images, videos, and other technical details.</span></li>
			</ol>
			
			<p>
         To get involved, join our <a href="https://github.com/oManual">Github Project page</a>.  There you can submit bugs, discuss features and submit code.  If you have an oManual integration or module or want to know how you can help, <a href="mailto:kyle@ifixit.com">drop us an email!</a>
			</p>
			
		</div>
<?php require_once('footer.php') ?>

