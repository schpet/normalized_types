require "active_model/type"

# https://github.com/rails/rails/blob/master/activemodel/lib/active_model/type/string.rb

module NormalizedTypes
  class String < ActiveModel::Type::String
    attr_reader :strip, :presence, :squish, :truncate, :downcase

    def initialize(strip: true, presence: true, squish: false, truncate: 10_000, downcase: false)
      @strip = strip
      @presence = presence
      @squish = squish
      @truncate = truncate
      @downcase = downcase
    end

    private

    def cast_value(value)
      case value
      when ::String then normalize_string(value)
      when true then "t".freeze
      when false then "f".freeze
      else value.to_s
      end
    end

    def normalize_string(value)
      if strip
        value = value.strip
      end

      if squish
        value = value.squish
      end

      if truncate
        value = value.truncate(truncate, omission: "")
      end

      if downcase
        value = value.downcase
      end

      if presence
        return unless value.present?
      end

      ::String.new(value)
    end
  end
end
