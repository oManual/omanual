<?php 
$thisPage = 'standard'; //Short name for page.
$pageTitle = 'Proposed Standard'; //Used in the <title> area.
$color = 'red'; //Color choices: red, blue, aqua, yellow.
?>

<?php require_once('header.php') ?>

<div class="intcontent">

   <h2>Draft Standard</h2>

   <div class="sidebar">

      <div class="license">

         <h3>Version <strong class="red">1.0</strong></h3>

         <p>Approved by the IEEE Standards Association. <br /><strong>IEEE 1874 - Standard for Documentation Schema for Repair of Electronic Devices.</strong></p>

         <h3>License</h3>

         <p class="license-bg">This specification is made available under the Creative Commons <a href="http://creativecommons.org/licenses/by/3.0/">Attribution 3.0 Unported License.</a></p>

         <h3>Authors</h3>

         <ul>
            <li><a href="mailto:kyle.nospam@ifixit.com">Kyle Wiens</a>, iFixit + Dozuki</li>
            <li><a href="https://plus.google.com/118122803738776668928/posts">Timothy Asp</a>, iFixit + Dozuki</li>
            <li><a href="http://knowsgreen.com/site/">Mark Schaffer</a>, Schaffer Environmental</li>
            <li><a href="https://plus.google.com/109228109284798290109/posts">Daniel Beardsley</a>, iFixit + Dozuki</li>
         </ul>

         <h3>IEEE Balloting Group</h3>

         <ul>
            <li>Huawei</li>
            <li>ChongQing University</li>
            <li>Coughlin Associates</li>
            <li>Grant County Public Utility District</li>
            <li>Office of Naval Research (ONR)</li>
            <li>General Cable Technologies Corporation</li>
            <li>Rockwell Automation</li>
            <li>Southeastern Pennsylvania Transportation Authority</li>
            <li>Schaffer Environmental</li>
            <li>Lockheed Martin Corporation</li>
            <li>Rohde &amp; Schwarz</li>
            <li>Zenith</li>
            <li>Open Source Ecology</li>
            <li>Wi2Wi</li>
            <li>iFixit</li>
            <li>Dozuki</li>
            <li>Huawei</li>
         </ul>

      </div>
   </div>

   <h3>Abstract</h3>

   <p>
oManual is a standard for storing and transmitting procedural manuals. 
oManual's common data format can be used as an offline file package or via 
online RESTful API endpoints, using XML or JSON. This format is useful for 
documenting and describing repairs, how-to, work instructions, or any other 
step-by-step guides. oManual makes it easy to exchange procedural 
information between services while maintaining usability on mobile devices.
   </p>

   <p>
This specification describes the oManual data model, web services API, and 
bundle file format (a collection of structured files containing a file manifest 
XML format, a category XML format and a guide XML format). The specification 
may be expanded in the future to enable additional types of documents.
   </p>

   <div class="clearfix"></div>

   <div class="sidebar">
       <h3>Package Example</h3>
       <? require_once('package_structure.php') ?>
   </div>


   <div class="schemas">
      <h3>XML Schemas</h3>

      <p>There are currently three defined oManual XML schemas.</p>

      <ul>
         <li><a href="#manifest">Manifest</a> <em>Required</em>
         <br />Listing of oManual package contents. One per package.</li>
         <li><a href="#category">Category</a> <em>Optional</em>
         <br />Description of the category for which the guide describe manipulating. One per package.</li>
         <li><a href="#guide">Guide</a> <em>Optional</em>
         <br />Structured list of step-by-step, procedural instructions with referenced media.</li>
      </ul>
   </div>

   <div class="endpoints">
      <h3>API Endpoints</h3>

      <p>The four endpoints listed below are all that is necessary to access your oManual data through a REST API. For an example API implementation, take a look at the <a href="https://www.ifixit.com/api/2.0/doc">iFixit API</a>.</p>

      <ul>
         <li><a href="#guides"><span class="method">GET</span> /guides</a>
         <br />List all guides</li>
         <li><a href="#guide"><span class="method">GET</span> /guides/{guideid}</a>
         <br />Returns detailed information and procedural steps from a specific guide.</li>
         <li><a href="#category-list"><span class="method">GET</span> /categories</a>
         <br />Returns detailed category hierarchy which is the structured relationship between categories listed in the manifest.xml file.</li>
         <li><a href="#category"><span class="method">GET</span> /categories/{categoryname}</a>
         <br />Returns detailed category information including category specific media and the list of guides.</li>
      </ul>
   </div>

   <br style="clear:both;" />

   <a name="manifest"></a>
   <h3>
       Manifest: <span class="greytxt">XML Schema</span>
       <a href="schema/omanual_manifest.xsd" class="downloadbtn">Download XSD</a>
       <a href="schema/omanual_manifest_example.xml" class="downloadbtn">Download Example</a>
   </h3>

   <div class="codeview">
      <!-- BEGIN CODE -->
      <?php require_once('schema/examples/manifest_ex.html') ?>
      <!-- END CODE -->
   </div>

   <a name="category"></a>
   <h3>
       Category: <span class="greytxt">XML Schema</span>
       <a href="schema/omanual_category.xsd" class="downloadbtn">Download XSD</a>
       <a href="schema/omanual_category_example.xml" class="downloadbtn">Download Example</a>
   </h3>

   <div class="codeview">
      <!-- BEGIN CODE -->
      <?php require_once('schema/examples/category_ex.html') ?>
      <!-- END CODE -->
   </div>

   <a name="guide"></a>
   <h3>
      guide: <span class="greytxt">XML Schema</span>
      <a href="omanual_procedure.xsd" class="downloadbtn">Download XSD</a>
      <a href="omanual_procedure_example.xml" class="downloadbtn">Download Example</a>
   </h3>

   <div class="codeview">
      <!-- BEGIN CODE -->
      <?php require_once('schema/examples/guide_ex.html') ?>
      <!-- END CODE -->
   </div>

   <h2>API Responses</h2>

   <ul class="responses">
      <li>
         <a name="guides"></a>
         <h3>
            GET /guides
            <a href="https://ifixit.com/api/2.0/guides?limit=1000" target="_blank" class="downloadbtn">Example </a>
         </h3>
      </li>
      <li>
         <a name="guide"></a>
         <h3>
            GET /guides/{guideid}
            <a href="https://ifixit.com/api/2.0/guides/123" target="_blank" class="downloadbtn">Example </a>
         </h3>
      </li>
      <li>
         <a name="category-list"></a>
         <h3>
            GET /categories
            <a href="https://ifixit.com/api/2.0/categories" target="_blank" class="downloadbtn">Example</a>
         </h3>
      </li>
      <li>
         <a name="category"></a>
         <h3>
            GET /categories/{categoryname}
            <a href="https://ifixit.com/api/2.0/categories/iPhone%205%20Teardown" target="_blank" class="downloadbtn">Example </a>
         </h3>
      </li>
   </ul>
</div>

<?php require_once('footer.php') ?>

