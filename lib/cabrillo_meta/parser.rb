require 'nokogiri'

module CabrilloMeta
  class Parser
    class << self

      def parse_qso(template)
        res = {}
        lines = template.lines
        while(line = lines.shift)
          break if line =~ /^QSO:/
        end
        match = /^QSO:\s+(?<common>freq\s+mo\sdate\s+time)\s+(?<sent>call\s+.*)(?<recv>call\s+.*)$/.match(line)
        if match
          formats = parse_format(lines.shift)
          match.names.each do |k|
            keys = parse_keys(match[k])
            res[k] = Hash[keys.map { |x| [x, formats.shift] }]
          end
        end
        res
      end

      def parse_keys(str)
        str.scan(/(?:([A-z]+)(?:\s*))/).flatten
      end

      def parse_format(str)
        format = []
        str.scan(/(?:([A-z*-]+)(?:\s+|$)(?<!QSO))/) do |s, _|
          # remove non alpha characters from end and beginning
          s.gsub!(/\A[^A-z*]+|[^A-z*]+\Z/, '')
          format << { length: s.length, type: parse_type(s) }
        end
        format
      end

      def parse_type(str)
        case str
        when /\A[an\-*]+\Z/ then 'string'
        when /\A[tn]+\Z/ then 'number'
        when /\Ayyyy-mm-dd\Z/ then 'date'
        else
          raise "Unknown format type for: #{str}"
        end
      end

    end
  end
end

