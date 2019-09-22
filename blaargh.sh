#!/bin/bash


cd ${1:-.};
# putline html
tmpl='<!doctype html><meta charset=utf-8><meta name=viewport content="width=device-width,initial-scale=1"><style>html{padding:1%;font-size:16px;font-family:sans-serif}h1 a,h2 a,h3 a,h4 a{text-decoration:none;color:#000;font-style:normal}h1,h2{font-size:180%}h3,h4{font-size:150%}h1,h3{font-weight:550}h2,h4{font-weight:400}p{line-height:175%;:}header{border:1px solid #000;padding:2%;margin-left:50vw}img{width:80vw;margin:0 8vw 0 12vw}</style><header><h1>blaargh.club</h1><p>spme text</header>'
foot='<p><a href="/index.html">home</a></p></body></html>'
markdown_convert="hoedown --all-block --all-span"

for i in src/*md; do
	# takes a file as $1 and removes path for 
	# md_filename, sub html for md for html_filename
	# src/file.md --> file.me --> file.html
	echo $i
	md_filename="$(basename $i)";
	html_filename="${md_filename/md/html}";
	html="$($markdown_convert src/$md_filename)"
	echo "$tmpl$html$foot" > public/$html_filename;
done


# convert *md file

#input_file="$1";

#output_file="$2"

#filename="$(basename "$input_file")";
#html_name="${n/md/html}"


#html="$(hoedown --all-block --all-span $input_file)"

#echo "$tmpl$html$foot" > "public/$html_name"

