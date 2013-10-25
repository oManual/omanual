#!/usr/bin/env python

import os.path
from pygments import highlight
from pygments.lexers import get_lexer_by_name
from pygments.formatters import HtmlFormatter

# set up file path bidnizz
files = ['omanual_category_example.xml', 'omanual_guide_example.xml']
version = '1.0'
basepath = '../schema/' + version + '/examples/'

# initialize pygments lexer and formatter
lexer = get_lexer_by_name("xml", stripall=True)
formatter = HtmlFormatter(linenos=True, cssclass="highlight", encoding='utf-8')

for filename in files:
    fullpath = basepath + filename
    f = open(fullpath, 'r')
    code = f.read()

    result = highlight(code, lexer, formatter)

    print result

    fexample = open(basepath + os.path.splitext(os.path.basename(filename))[0] + ".html", "w")
    fexample.write(result)
    f.close()
    fexample.close()

