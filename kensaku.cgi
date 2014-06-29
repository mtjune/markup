#!/usr/bin/env ruby
# -*- encoding: utf-8 -*-

require 'cgi'
require 'xml/xslt'

cgi = CGI.new


xslt = XML::XSLT.new()
xslt.xml = "shoshi.xml"
xslt.xsl = "kensaku.xsl"
xslt.parameters = {"s_title" => cgi["title"], "s_auther" => cgi["auther"], "sort" => cgi["sortkey"]}

out = xslt.serve()

print cgi.header("text/html; charset=UTF-8")
print out