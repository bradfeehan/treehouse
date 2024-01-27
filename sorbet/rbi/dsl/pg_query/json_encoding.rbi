# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::JsonEncoding`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::JsonEncoding`.

module PgQuery::JsonEncoding
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::JsonEncoding::JSON_ENCODING_UNDEFINED = 0
PgQuery::JsonEncoding::JS_ENC_DEFAULT = 1
PgQuery::JsonEncoding::JS_ENC_UTF16 = 3
PgQuery::JsonEncoding::JS_ENC_UTF32 = 4
PgQuery::JsonEncoding::JS_ENC_UTF8 = 2
