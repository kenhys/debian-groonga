# Copyright (C) 2017 Yasuhiro Horimoto <horimoto@clear-code.com>
# Copyright (C) 2017 Kentaro Hayashi <hayashi@clear-code.com>
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

require "groonga-log/statistic"

module GroongaLog
  class Parser
    PATTERN =
      /\A(?<year>\d{4})-(?<month>\d\d)-(?<day>\d\d)
          \ (?<hour>\d\d):(?<minute>\d\d):(?<second>\d\d)\.(?<micro_second>\d+)
          \|(?<log_level>.)
          \|(?:(?<pid>\d+):)?
          \ (?<message>.*)/x

    def parse(input)
      return to_enum(:parse, input) unless block_given?

      input.each_line do |line|
        if line.respond_to?(:valid_encoding?)
          next unless line.valid_encoding?
        end

        m = PATTERN.match(line)

        statistic = Statistic.new

        year = m["year"].to_i
        month = m["month"].to_i
        day = m["day"].to_i
        hour = m["hour"].to_i
        minute = m["minute"].to_i
        second = m["second"].to_i
        micro_second = m["micro_second"].to_i
        statistic.timestamp = Time.local(year, month, day,
                                         hour, minute, second, micro_second)
        statistic.log_level = log_level_to_symbol(m["log_level"])
        statistic.pid = m["pid"].to_i if m["pid"]
        statistic.message = m["message"]
        yield statistic
      end
    end

    private
    def log_level_to_symbol(level_text)
      case level_text
      when "E"
        :emergency
      when "A"
        :alert
      when "C"
        :critical
      when "e"
        :error
      when "w"
        :warning
      when "n"
        :notice
      when "i"
        :information
      when "d"
        :debug
      when "-"
        :dump
      end
    end
  end
end
