# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::TransactionStmtKind`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::TransactionStmtKind`.

module PgQuery::TransactionStmtKind
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::TransactionStmtKind::TRANSACTION_STMT_KIND_UNDEFINED = 0
PgQuery::TransactionStmtKind::TRANS_STMT_BEGIN = 1
PgQuery::TransactionStmtKind::TRANS_STMT_COMMIT = 3
PgQuery::TransactionStmtKind::TRANS_STMT_COMMIT_PREPARED = 9
PgQuery::TransactionStmtKind::TRANS_STMT_PREPARE = 8
PgQuery::TransactionStmtKind::TRANS_STMT_RELEASE = 6
PgQuery::TransactionStmtKind::TRANS_STMT_ROLLBACK = 4
PgQuery::TransactionStmtKind::TRANS_STMT_ROLLBACK_PREPARED = 10
PgQuery::TransactionStmtKind::TRANS_STMT_ROLLBACK_TO = 7
PgQuery::TransactionStmtKind::TRANS_STMT_SAVEPOINT = 5
PgQuery::TransactionStmtKind::TRANS_STMT_START = 2
