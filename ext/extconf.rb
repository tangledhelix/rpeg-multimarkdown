require 'mkmf'

dir_config('peg_multimarkdown')

$objs = %w[markdown.o markdown_lib.o markdown_output.o markdown_parser.o GLibFacade.o]

if pkg_config = find_executable('pkg-config')
  $CFLAGS = "-fcommon "+`#{pkg_config} --cflags glib-2.0`
  $LDFLAGS = `#{pkg_config} --libs glib-2.0`
else
  $CFLAGS = '-fcommon --std=c99'
  $LDFLAGS = ''
end

create_header
create_makefile('peg_multimarkdown')
