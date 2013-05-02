# Copy files out of the omanual dir into the current dir, then call this to format it into html
# Uses Pygments to color xml file : http://pygments.org/docs/cmdline/

cp examples/iPhone-5/manifest.xml examples/omanual_manifest_example_0.4.xml
cp examples/iPhone-5/iPhone-5.xml examples/omanual_topic_example_0.4.xml
cp examples/iPhone-5/iPhone-5-Teardown-10525/procedure.xml examples/omanual_procedure_example_0.4.xml

PYG=`which pygmentize`
echo "USAGE: $0 (writes *_ex.html files)"
$PYG -O encoding=utf-8 -f html -l xml examples/omanual_manifest_example_0.4.xml > examples/manifest_ex.html
$PYG -O encoding=utf-8 -f html -l xml examples/omanual_topic_example_0.4.xml > examples/topic_ex.html
$PYG -O encoding=utf-8 -f html -l xml examples/omanual_procedure_example_0.4.xml > examples/procedure_ex.html

