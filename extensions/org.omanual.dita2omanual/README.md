README for DITA to oManual converter plugin
===========================================

This plugin was contributed by iFixit.com and Dozuki.com.

Version
-------

1.0

Installing
----------
1. Unzip this zip file within the plugins folder of your installed DITA Open Toolkit.
2. Open a command window for DITA Open Toolkit operations (for example, in Windows, double-click on startcmd.bat in the root folder).
3. Integrate the plugin by typing this command and hitting Enter:
```sh
C:\DITA-OT\ant -f integrator.xml
```

Verifying
---------
To run the sample "taskbook" conversion from the java command line:

java -Dxml.catalog.files=catalog-dita.xml -Dxml.catalog.verbosity=1 net.sf.saxon.Transform -r org.apache.xml.resolver.tools.CatalogResolver -x org.apache.xml.resolver.tools.ResolvingXMLReader -y org.apache.xml.resolver.tools.ResolvingXMLReader -s:plugins/org.omanual.dita2omanual/dita/taskbook-omanual.ditamap -xsl:plugins/org.omanual.dita2omanual/xsl/dita2omanual.xsl > _temp/test.xml

Ant version:

```sh
C:\DITA-OT1.8.M2>ant -f plugins\org.omanual.dita2omanual\run-sample.xml
```

Documentation
-------------
The documentation is in the local file, d2o-userguide.pdf. The documentation source is in the doc folder. 

To produce a new PDF version of the documentation
(say after adding a new appendix), run the following Ant build task:

```sh
C:\DITA-OT1.8.M2>ant -f plugins\org.omanual.dita2omanual\docs_pdf.xml
```

Refer to the out folder of your DITA OT installation for the resulting PDF.

License
-------
ASL 2.0


Author
------

Don Day (donrday@contelligencegroup.com)

