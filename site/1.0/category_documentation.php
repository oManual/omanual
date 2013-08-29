
         <p>
            This document describes category metadata. A category can be anything you would write step-by-step procedures about, such as a manufactured object, or device.
            This also includes a list of guides in the package and a list of attached documents in the /media folder.
         </p>
         <p>
            Note: This is not a complete listing of package contents since each subfile
            may additionally reference its own media.
         </p>

         <div class="legend">
            <div class="req"><span class="box"></span> required</div>
            <div class="opt"><span class="box"></span> optional</div>
         </div>

            <div class="tagListing" id="category">
                  <div class="tag req">
                     <h4><a href="#category">category</a></h4>
                     <p class="desc">
                     The root of an oManual category.
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
                        Contains the title of the category document (which may differ from the category name).
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag req" id="category-info">
                        <h4><a href="#category-info">category_info</a></h4>
                        <p class="desc">
                        Text should contain the canonical name of the category.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes:</li>
                              <li><strong class="optional">manufacturer</strong> - <em>optional</em> Only relevant for devices. The canonical name of the device&#39;s manufacturer.</li>
                              <li><strong class="optional">introduced</strong> - <em>optional</em> Only relevant for devices. The date (ISO 8601 date in the format YYYY-MM-DDThh:mm:ssZ) that the device was first sold.</li>
                              <li><strong class="optional">discontinued</strong> - <em>optional</em> Only relevant for devices. The date (ISO 8601 date in the format YYYY-MM-DDThh:mm:ssZ) that the device was discontinued. If the device is still available, leave the attribute empty.</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag req" id="image-3">
                        <h4><a href="#image-3">image</a></h4>
                        <p class="desc">
                        Path to an image of the category, relative to this file.
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
                        A brief, simple HTML formatted description of the category.
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
                           A flag or informational note about the category. The text field contains a full text notice of what this flag means to the user.
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
                        <h4><a href="#categories-1">ancestors</a></h4>
                        <p class="desc">
                          List of categories, in descending order, to which the category belongs.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="category-1">
                        <div class="tag">
                           <h4><a href="#category-1">ancestor</a></h4>
                           <p class="desc">
                           A single category the category belongs to. There is not currently a global list of documentation categories.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes: None</li>
                              </ul>
                           </div>
                        </div>
                     </div>

                     <div class="tag req" id="children">
                        <h4><a href="#children">children</a></h4>
                        <p class="desc">
                        List of categories that have this category as a parent.  For example, an "MP3 Player" category could have "iPod", "Zune", etc as children.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="child">
                        <div class="tag">
                           <h4><a href="#child">child</a></h4>
                           <p class="desc">
                           The category name of the child belonging to this category.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes: None</li>
                              </ul>
                           </div>
                        </div>
                     </div>

                    <div class="tag req" id="documents-1">
                       <h4><a href="#documents-1">documents </a></h4>
                       <p class="desc">
                       </p>
                       <div>
                          <ul class="attr">
                             <li class="attr-intro">Attributes: None</li>
                          </ul>
                       </div>
                    </div>

                    <div class="subtag" id="document-1">
                       <div class="tag">
                          <h4><a href="#document-1">document </a></h4>
                          <p class="desc">
                          A document included in the package. The text for this element should be the path to the document.
                          </p>
                          <div>
                             <ul class="attr">
                                <li class="attr-intro">Attributes:</li>
                                <li><strong>id</strong> - <em>optional</em> Integer identifier for the document.</li>
                                <li><strong>type</strong> - <em>optional</em> The MIME type of the file.</li>
                                <li><strong>date</strong> - <em>optional</em> ISO 8601 date in the format YYYY-MM-DDThh:mm:ssZ. Last modified date of the document.</li>
                             </ul>
                          </div>
                       </div>
                    </div>

                     <div class="tag" id="solutions">
                        <h4><a href="#categories-1">solutions</a></h4>
                        <p class="desc">
                           A reference to an external mailing list, Q&amp;A site, message board - anywhere your audience can find additional troubleshooting information. For example, <a href="http://ifixit.com/Answers" title="iFixit Answers" target="_blank">iFixit Answers</a> and <a href="http://stackoverflow.com">Stack Overflow</a> are two examples of solution providers.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes:</li>
                              <li><strong>count</strong> <em>optional</em> Number of solutions available about this category.</li>
                              <li><strong>url</strong> <em>optional</em> URL to the category-specific solutions.</li>
                           </ul>
                        </div>
                     </div>

                     <div class="tag req" id="tools">
                        <h4><a href="#tools">tools</a></h4>
                        <p class="desc"></p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="tool">
                        <div class="tag">
                           <h4><a href="#tool">tool</a></h4>
                           <p class="desc">
                           A required or suggested tool/implement. Use a name common to all of your guides and specify variations using the type attribute.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes:</li>
                                 <li><strong>type</strong> <em>optional</em> The type of tool. Specifying type can be a useful way of consolidating tool names, for example an 8mm socket could be specified as name: socket, type: 8mm.</li>
                                 <li><strong>quantity</strong> <em>optional</em> Integer quantity of tool required. If omitted, this is assumed to be 1.</li>
                                 <li><strong>notes</strong> <em>optional</em> Information specific to using this tool for this guide.</li>
                                 <li><strong>thumbnail</strong> <em>optional</em> Path to an image to go along with the tool.</li>
                                 <li><strong>url</strong> <em>optional</em> A URL for an external reference describing the tool.</li>
                                 <li><strong>sku</strong> <em>optional</em> The manufacturer SKU / part number.</li>
                              </ul>
                           </div>
                        </div>
                     </div>

                     <div class="tag req" id="parts">
                        <h4><a href="#parts">parts</a></h4>
                        <p class="desc"></p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>

                     <div class="subtag" id="part">
                        <div class="tag">
                           <h4><a href="#part">part</a></h4>
                           <p class="desc">
                           A part, material, or ingredient used in this category.
                           </p>
                           <div>
                              <ul class="attr">
                                 <li class="attr-intro">Attributes:</li>
                                 <li><strong>sku</strong> <em>optional</em> A global string identifier for the part.</li>
                                 <li><strong>type</strong> <em>optional</em> The type of part. Specifying type can be a useful way of consolidating names, for example a 5Ω resistor could be specified as name: resistor, type: 5Ω.</li>
                                 <li><strong>quantity</strong> <em>optional</em> How many of this part are required.</li>
                                 <li><strong>thumbnail</strong> <em>optional</em> URI of an image to go along with the part.</li>
                                 <li><strong>url</strong> <em>optional</em> A URL for a page describing the part.</li>
                                 <li><strong>notes</strong> <em>optional</em> Information specific to using this part for this guide.</li>
                              </ul>
                           </div>
                        </div>
                     </div>

                     <div class="tag" id="content">
                        <h4><a href="#content">contents</a></h4>
                        <p class="desc">
                        Simple HTML-formatted text of the document. This is not required, but is an opportunity to provide additional unstructured information about the category.
                        </p>
                        <div>
                           <ul class="attr">
                              <li class="attr-intro">Attributes: None</li>
                           </ul>
                        </div>
                     </div>
                    <div class="tag req" id="guides">
                       <h4><a href="#guides">guides</a></h4>
                       <p class="desc">
                       List of guides about the category.
                       </p>
                       <div>
                          <ul class="attr">
                             <li class="attr-intro">Attributes: None</li>
                          </ul>
                       </div>
                    </div>

                    <div class="subtag" id="guide-1">
                       <div class="tag">
                          <h4><a href="#guide-1">guide </a></h4>
                          <p class="desc">
                          Individual guide element.  A short description of the guide that's contained within the oManual package.  The corresponding file in the package has the filename <i>guide-{id}.xml</i>.
                          </p>
                          <div>
                             <ul class="attr">
                                <li class="attr-intro">Attributes:</li>
                                <li><strong>id</strong> - <em>required</em> An integer identifier for the guide.</li>
                                <li><strong>subject</strong> - <em>required</em> The subcomponent the guide will be operating on.</li>
                                <li><strong>type</strong> - <em>required</em> The type of guide to perform. Suggested options: installation, maintenance, repair, disassembly, technique.</li>
                             </ul>
                          </div>
                       </div>

                       <div class="subtag" id="title-2">
                          <div class="tag">
                             <h4><a href="#title-2">title </a></h4>
                             <p class="desc">
                             The title of the guide.
                             </p>
                             <div>
                                <ul class="attr">
                                   <li class="attr-intro">Attributes: None</li>
                                </ul>
                             </div>
                          </div>

                          <div class="tag req" id="path">
                             <h4><a href="#path">path</a></h4>
                             <p class="desc">
                             Path to the guide.
                             </p>
                             <div>
                                <ul class="attr">
                                   <li class="attr-intro">Attributes: None</li>
                                </ul>
                             </div>
                          </div>

                          <div class="tag" id="url">
                             <h4><a href="#url">url</a></h4>
                             <p class="desc">
                             URL to the canonical online source for this guide.
                             </p>
                             <div>
                                <ul class="attr">
                                   <li class="attr-intro">Attributes: None</li>
                                </ul>
                             </div>
                          </div>

                          <div class="tag" id="image">
                             <h4><a href="#image">image</a></h4>
                             <p class="desc">
                             Path to the main category image.
                             </p>
                             <div>
                                <ul class="attr">
                                    <li class="attr-intro">Attributes:</li>
                                    <li><strong>mini</strong> <em>optional</em> Path to a thumbnail of the image no larger than 56x42.</li>
                                    <li><strong>thumbnail</strong> <em>optional</em> Path to a thumbnail of the image no larger than 96x72.</li>
                                    <li><strong>standard</strong> <em>optional</em> Path to a thumbnail of the image no larger than 300x225.</li>
                                    <li><strong>medium</strong> <em>optional</em> Path to a thumbnail of the image no larger than 592x444.</li>
                                    <li><strong>large</strong> <em>optional</em> Path to a thumbnail of the image no larger than 800x600.</li>
                                </ul>
                             </div>
                          </div>
                       </div>
                    </div>
                  </div>
              </div>

