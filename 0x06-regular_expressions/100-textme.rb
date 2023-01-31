#!/usr/bin/env ruby
puts ARGV[0].scan(/from:\w+|to:.\d{10,11}|flags:............/).join