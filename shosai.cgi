#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'cgi'
require 'xml/xslt'

cgi = CGI.new

query_array = ENV["QUERY_STRING"].split("=")
query = query_array[1]

xslt = XML::XSLT.new()
xslt.xml = "shoshi.xml"
xslt.xsl = "shosai.xsl"
xslt.parameters = {"query" => query}

out = xslt.serve()

print cgi.header("text/html; charset=UTF-8")
print out