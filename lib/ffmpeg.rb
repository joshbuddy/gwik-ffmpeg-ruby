# Copyright (c)2008 Antonin Amand.
# Licensed under the Ruby License. See LICENSE for details.
#
require 'ffmpeg/ffmpeg'

module FFMPEG

  class InputFormat

    def first_video_stream
      streams.find { |st| st.type == :video }
    end

    def first_audio_stream
      streams.find { |st| st.type == :audio }
    end

  end

  class Stream

    def type
      codec.type
    end

  end

end
