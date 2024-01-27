# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::PublicationObjSpecType`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::PublicationObjSpecType`.

module PgQuery::PublicationObjSpecType
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::PublicationObjSpecType::PUBLICATIONOBJ_CONTINUATION = 4
PgQuery::PublicationObjSpecType::PUBLICATIONOBJ_TABLE = 1
PgQuery::PublicationObjSpecType::PUBLICATIONOBJ_TABLES_IN_CUR_SCHEMA = 3
PgQuery::PublicationObjSpecType::PUBLICATIONOBJ_TABLES_IN_SCHEMA = 2
PgQuery::PublicationObjSpecType::PUBLICATION_OBJ_SPEC_TYPE_UNDEFINED = 0