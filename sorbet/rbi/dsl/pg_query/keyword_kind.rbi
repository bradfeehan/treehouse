# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::KeywordKind`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::KeywordKind`.

module PgQuery::KeywordKind
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::KeywordKind::COL_NAME_KEYWORD = 2
PgQuery::KeywordKind::NO_KEYWORD = 0
PgQuery::KeywordKind::RESERVED_KEYWORD = 4
PgQuery::KeywordKind::TYPE_FUNC_NAME_KEYWORD = 3
PgQuery::KeywordKind::UNRESERVED_KEYWORD = 1
