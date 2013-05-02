
         <p>
            This document describes topic metadata. A topic can be anything you would write step-by-step procedures about, such as a manufactured object, or device.
         </p>

         <div class="legend">
            <div class="req"><span class="box"></span> required</div>
            <div class="opt"><span class="box"></span> optional</div>
         </div>

            <div class="tagListing" id="topic">
                  <div class="tag req">
                     <h4><a href="#topic">topic</a></h4>
                     <p class="desc">
                     The root of an oManual topic.
                     </p>
                     <div>
                        <ul class="attr">
                           <li class="attr-intro">Attributes:</li>
                           <li><strong class="req">locale</strong> - <em>required</em> The language the package is written in.</li>
                        </ul>
                     </div>
                  </div>

                  <div class="subtag" id="title-1">
                     <div class="tag req">
                        <h4><a href="#title-1">title</a></h4>
                        <p class="desc">
                        Contains the title of the topic document (which may differ from the topic name).
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag req" id="topic-info">
                        <h4><a href="#topic-info">topic_info</a></h4>
                        <p class="desc">
                        Text should contain the canonical name of the topic.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes:</li>
                              <li><strong class="optional">manufacturer</strong> - <em>optional</em> Only relevant for devices. The canonical name of the device&#39;s manufacturer.</li>
                              <li><strong class="optional">introduced</strong> - <em>optional</em> Only relevant for devices. The UNIX epoch date that the device was first sold.</li>
                              <li><strong class="optional">discontinued</strong> - <em>optional</em> Only relevant for devices. The UNIX epoch date that the device was discontinued. If the device is still available, leave the attribute empty.</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag req" id="image-3">
                        <h4><a href="#image-3">image</a></h4>
                        <p class="desc">
                        Path to an image of the topic, relative to this file.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag" id="description">
                        <h4><a href="#description">description</a></h4>
                        <p class="desc">
                        A brief, simple HTML formatted description of the document.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag req" id="flags-1">
                        <h4><a href="#flags-1">flags</a></h4>
                        <p class="desc">
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="flag-1">
                        <div class="tag">
                           <a href="#flag-1"><h4>flag</h4> </a>
                           <p class="desc">
                           A flag or informational note about the topic. The text field contains a full text notice of what this flag means to the user.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes:</li>
                                 <li><strong>id</strong> - <em>optional</em> A unique identifier for the flag.</li>
                                 <li><strong class="req">title</strong> - <em>required</em> A short title for the flag. ex: In Progress</li>
                                 <li><strong>image</strong> <em>optional</em> URI of an image to go along with the flag, no larger than 44x44.</li>
                              </ul>
                           </div>
                        </div>
                     </div>

                     <div class="tag req" id="categories-1">
                        <h4><a href="#categories-1">categories</a></h4>
                        <p class="desc">
                        List of categories the topic belongs to.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="category-1">
                        <div class="tag">
                           <h4><a href="#category-1">category</a></h4>
                           <p class="desc">
                           A single category the topic belongs to. There is not currently a global list of documentation categories.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes: None</li>
                              </ul>
                           </div>
                        </div>
                     </div>

                     <div class="tag" id="solutions">
                        <h4><a href="#categories-1">solutions</a></h4>
                        <p class="desc">
                           A reference to an external mailinglist, Q&amp;A site, message board - anywhere your audience can find additional troubleshooting information. For example, <a href="http://ifixit.com/Answers" title="iFixit Answers" target="_blank">iFixit Answers</a> and <a href="http://stackoverflow.com">Stack Overflow</a> are two examples of solution providers.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes:</li>
                              <li><strong>count</strong> <em>optional</em> Number of solutions available on this topic.</li>
                              <li><strong>url</strong> <em>optional</em> URL to the topic-specific solutions.</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag req" id="parts">
                        <h4><a href="#parts">parts</a></h4>
                        <p class="desc">
                        Overall parts list for the topic.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes:</li>
                              <li><strong>url</strong> <em>optional</em> link to overall parts list.</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="part_category">
                        <div class="tag">
                           <h4><a href="#part">part_category</a></h4>
                           <p class="desc">
                           A part, material, or ingredient with the count and url to further information regarding the part.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes:</li>
                                 <li><strong>tag</strong> <em>optional</em> The tag, or name, of the part.</li>
                                 <li><strong>count</strong> <em>optional</em> How many of this part are in included in the procedures of this guide.</li>
                                 <li><strong>url</strong> <em>optional</em> link to more information of the part.</li>
                              </ul>
                           </div>
                        </div>
                     </div>


                     <div class="tag req" id="tools-1">
                        <h4><a href="#tools-1">tools</a></h4>
                        <p class="desc">
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="tool-1">
                        <div class="tag">
                           <h4><a href="#tool-1">tool</a></h4>
                           <p class="desc">
                           A tool used to work on this topic. Text is the common name for the tool.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes:</li>
                                 <li><strong>name</strong> - <em>optional</em> The canonical name of the tool.</li>
                                 <li><strong class="req">url</strong> - <em>required</em> An URL to an online supplier&#39;s listing for this tool.</li>
                                 <li><strong>thumbnail</strong> - <em>optional</em> URL for an image that represents the tool.</li>
                              </ul>
                           </div>
                        </div>

                     </div>

                     <div class="tag" id="content">
                        <h4><a href="#content">contents</a></h4>
                        <p class="desc">
                        HTML-formatted text of the document. This is not required, but is an opportunity to provide additional unstructured information about the topic.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>
                  </div>
              </div>

