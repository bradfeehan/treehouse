# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::AlterPublicationAction`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::AlterPublicationAction`.

module PgQuery::AlterPublicationAction
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::AlterPublicationAction::ALTER_PUBLICATION_ACTION_UNDEFINED = 0
PgQuery::AlterPublicationAction::AP_AddObjects = 1
PgQuery::AlterPublicationAction::AP_DropObjects = 2
PgQuery::AlterPublicationAction::AP_SetObjects = 3
