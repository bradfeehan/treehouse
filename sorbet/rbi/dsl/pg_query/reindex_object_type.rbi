# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::ReindexObjectType`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::ReindexObjectType`.

module PgQuery::ReindexObjectType
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::ReindexObjectType::REINDEX_OBJECT_DATABASE = 5
PgQuery::ReindexObjectType::REINDEX_OBJECT_INDEX = 1
PgQuery::ReindexObjectType::REINDEX_OBJECT_SCHEMA = 3
PgQuery::ReindexObjectType::REINDEX_OBJECT_SYSTEM = 4
PgQuery::ReindexObjectType::REINDEX_OBJECT_TABLE = 2
PgQuery::ReindexObjectType::REINDEX_OBJECT_TYPE_UNDEFINED = 0