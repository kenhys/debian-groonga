#!/usr/bin/env ruby
#
# Copyright (C) 2012-2013  Kouhei Sutou <kou@clear-code.com>
#
# This library is free software; you can redistribute it and/or
# modify it under the terms of the GNU Lesser General Public
# License as published by the Free Software Foundation; either
# version 2.1 of the License, or (at your option) any later version.
#
# This library is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# Lesser General Public License for more details.
#
# You should have received a copy of the GNU Lesser General Public
# License along with this library; if not, write to the Free Software
# Foundation, Inc., 51 Franklin Street, Fifth Floor, Boston, MA  02110-1301  USA

$VERBOSE = true

require "pathname"

base_dir = Pathname.new(__FILE__).dirname.parent.expand_path
top_dir = base_dir.parent

lib_dir = base_dir + "lib"
test_dir = base_dir + "test"

require "test-unit"
require "test/unit/notify"

Test::Unit::Priority.enable

$LOAD_PATH.unshift(lib_dir.to_s)

$LOAD_PATH.unshift(test_dir.to_s)
require "helper"

Dir.glob("#{base_dir}/test/**/test{_,-}*.rb") do |file|
  require file.sub(/\.rb\z/, '')
end

ENV["TEST_UNIT_MAX_DIFF_TARGET_STRING_SIZE"] ||= "5000"

exit Test::Unit::AutoRunner.run
