<?php 
   $thisPage = 'documentation'; //Short name for page.
   $pageTitle = 'Documentation'; //Used in the <title> area.
   $color = 'yellow'; //Color choices: red, blue, aqua, yellow.
?>

<?php require_once('header.php') ?>

<div class="intcontent">

   <h2>Documentation</h2>

   <p>
A manual can describe a collection of guides, or just a single guide.
An example service manual for a Dell laptop might include a dozen guides,
technical descriptions of the device, or hundreds of photos and videos.
The manual could be accessed by reading a .omanual file on a desktop computer,
or on a tablet or smartphone via a web service.
   </p>

   <p>
The common oManual data format can be expressed as XML (useful for 
interoperability with legacy data in formats such as DITA) or made available 
over a web API using mobile-friendly JSON.
   </p>

   <ul class="tblcontents">
      <li><a href="#data-specification">Data Specification</a>
         <ol>
            <li><a href="#category">Category Documentation</a></li>
            <li><a href="#guide">Guide Documentation</a></li>
         </ol>
      </li>
      <li><a href="#transmission-formats">Transmission Formats</a>
         <ol>
            <li>
               <a href="#package">.oManual File Package</a>
            </li>
            <li><a href="#api-specification">API Specification</a></li>
         </ol>
      </li>
      <li><a href="#more-info">More Information</a>
         <ol>
            <li><a href="#simplified-html">Simplified HTML</a></li>
            <li><a href="#paths">Allowed Paths</a></li>
            <li><a href="#design-paradigms">Design Paradigms</a></li>
         </ol>
      </li>
   </ul>

   <h2 id="data-specification">Data Specification</h2>

   <h3 id="category">
      Category Documentation
      <a href="omanual_category.xsd" class="downloadbtn">XML Schema Definition</a>
      <a href="omanual_category_example.xml" class="downloadbtn">Example XML</a>
      <a href="https://www.ifixit.com/api/2.0/categories/iPhone%205?pretty" class="downloadbtn">Example JSON</a>
   </h3>

   <? include 'category_documentation.php'; ?>

   <h3 id="guide">
      Guide Documentation
      <a href="omanual_guide.xsd" class="downloadbtn">XML Schema Definition</a>
      <a href="omanual_guide_example.xml" class="downloadbtn">Example XML</a>
      <a href="https://www.ifixit.com/api/2.0/guides/10525?pretty" class="downloadbtn">Example JSON</a>
   </h3>

   <? include 'guide_documentation.php'; ?>

   <h2 id="transmission-formats">Transmission Formats</h2>

   <h3 id="package">
      .oManual File Package
      <a href="http://www.ifixit.com/Misc/iMac-G5-20-Model-A1145.omanual" class="downloadbtn">Example oManual Package</a>
   </h3>

   <? include 'package_documentation.php'; ?>

   <h3 id="api-specification">API Specification</h3>

   <? include 'api_documentation.php'; ?>

   <h2 id="more-info">More Information</h2>

   <h3 id="simplified-html">Simplified HTML</h3>
   <p>Where specified, formatted text within the standard may use simplified XHTML. The text must validate and should not be escaped via CDATA. Simplified HTML is defined as these HTML tags:</p>
   <pre class="codeview"><code><?= htmlentities('<p><a><strong><em><h1><h2><h3><h4><h5><h6><tt><pre><code><br><ul><li><sub><sup><del><ins><div>'); ?></code></pre>
   <p>With these attributes:</p>
   <pre class="codeview"><code>id, class, href, style, rel, title, target</code></pre>

   <h3 id="paths">Allowed Paths</h3>
   <p>Paths can be either either an URI to a web resource or a local path, absolute from the base of the package. Local paths are only allowed for offline packages. Fully qualified URIs are always allowed.</p>

   <h3 id="design-paradigms">Design Paradigms</h3>
   <p>Design content for display. Yes, you can stuff really long paragraphs into a single step. But it won't look good!</p>
   <p>Make life easy for programmers. The most efficient file package will only have a single copy of each image, but providing urls to pre-rendered thumbnails makes designing mobile applications fast.</p>

</div>

<?php require_once('footer.php') ?>


