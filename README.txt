= quips

* www.commandline.org

== DESCRIPTION:

A silly project to provide contextual 'fortune' like sayings 
to the console for you applications

== FEATURES/PROBLEMS:

* Feature complete.  Includes Gem install support

== SYNOPSIS:

  From command line:
     quips
     quips --help
     quips programming

  require 'rubygems'
  require 'quips'

  quipper = Quips.create_default_quips
  pithy_saying = quipper.any_quip  #Get any quip
  pithy_topical_saying = quipper.quip_for "topic" #see data file 

  The YAML data file is installed with the Gem wich is straight forward
  to follow.  Season to taste with your own content and quip away.

== REQUIREMENTS:

* flexmock required to build

== INSTALL:

* sudo gem install quips

== LICENSE:

(The MIT License)

Copyright (c) 2008 Garrick West

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
