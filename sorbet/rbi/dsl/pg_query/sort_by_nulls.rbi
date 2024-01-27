# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::SortByNulls`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::SortByNulls`.

module PgQuery::SortByNulls
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::SortByNulls::SORTBY_NULLS_DEFAULT = 1
PgQuery::SortByNulls::SORTBY_NULLS_FIRST = 2
PgQuery::SortByNulls::SORTBY_NULLS_LAST = 3
PgQuery::SortByNulls::SORT_BY_NULLS_UNDEFINED = 0