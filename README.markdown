Ruby PEG MultiMarkdown
======================

An extension library around [Fletcher Penney's implementation][1]
of MultiMarkdown in C. This library is based (almost entirely) on 
[rpeg-markdown][2], which is a ruby extension library around
[John MacFarlane's C implementation of Markdown][3].

[1]: http://github.com/fletcher/peg-multimarkdown/
[2]: http://github.com/rtomayko/rpeg-markdown
[3]: http://github.com/jgm/peg-markdown/

Synopsis
--------

    >> require 'multimarkdown'
    >> puts MultiMarkdown.new('Hello, world.').to_html
    <p>Hello, world.</p>

    >> puts MultiMarkdown.new('_Hello World!_', :smart, :filter_html).to_html
    <p><em>Hello World!</em></p>

    >> puts MultiMarkdown.new('_Hello World!_').to_latex
    \emph{Hello World!}

    >> PEGMultiMarkdown.new('Hello! World!')

Hacking
-------

This library requires a recent version of glib2. All modern GNU userland
systems should be fine.

Hacking:

    $ git clone git://github.com/djungelvral/rpeg-multimarkdown.git
    $ cd rpeg-multimarkdown
    $ rake test

COPYING
-------

The peg-markdown, peg-multimarkdown, and Ruby PEG Markdown extension sources
are licensed under the GPL and the Ruby PEG MultiMarkdown extension sources
adopts this license. See the file LICENSE included with this distribution for
more information.
