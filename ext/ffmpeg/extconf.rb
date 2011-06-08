#!/usr/bin/env ruby
# --with-ffmpeg-dir=/opt/ffmpeg

require 'mkmf'

if find_executable('pkg-config')
  $CFLAGS << ' ' + `pkg-config libavfilter --cflags`.strip
  $CFLAGS << ' ' + `pkg-config libavcodec --cflags`.strip
  $CFLAGS << ' ' + `pkg-config libavutil --cflags`.strip
  $CFLAGS << ' ' + `pkg-config libswscale --cflags`.strip
  $LDFLAGS << ' ' + `pkg-config libavfilter --libs`.strip
  $LDFLAGS << ' ' + `pkg-config libavcodec --libs`.strip
  $LDFLAGS << ' ' + `pkg-config libavutil --libs`.strip
  $LDFLAGS << ' ' + `pkg-config libswscale --libs`.strip
end

ffmpeg_ruby_headers = ["ffmpeg_utils.h", "ffmpeg.h"]

ffmpeg_ruby_headers.each { |lib| have_header(lib) }

ffmpeg_include, ffmpeg_lib = dir_config("ffmpeg")
dir_config("libswscale")

$CFLAGS << " -W -Wall"
#$LDFLAGS << " -rpath #{ffmpeg_lib}"

have_library("avformat")
find_header('libavformat/avformat.h')

have_library("avcodec")
find_header('libavutil/avutil.h')

have_library("avutil")
find_header('libavcodec/avcodec.h')

have_library("swscale")
find_header('libswscale/swscale.h')
 
#$objs = %w(ffmpeg.o ffmpeg_format.o ffmpeg_input_format.o ffmpeg_stream.o ffmpeg_utils.o ffmpeg_frame.o ffmpeg_codec.o)

create_makefile("ffmpeg/FFMPEG_core")
