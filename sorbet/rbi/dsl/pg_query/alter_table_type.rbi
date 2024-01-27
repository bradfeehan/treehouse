# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for dynamic methods in `PgQuery::AlterTableType`.
# Please instead update this file by running `bin/tapioca dsl PgQuery::AlterTableType`.

module PgQuery::AlterTableType
  class << self
    sig { returns(Google::Protobuf::EnumDescriptor) }
    def descriptor; end

    sig { params(number: Integer).returns(T.nilable(Symbol)) }
    def lookup(number); end

    sig { params(symbol: Symbol).returns(T.nilable(Integer)) }
    def resolve(symbol); end
  end
end

PgQuery::AlterTableType::ALTER_TABLE_TYPE_UNDEFINED = 0
PgQuery::AlterTableType::AT_AddColumn = 1
PgQuery::AlterTableType::AT_AddColumnToView = 2
PgQuery::AlterTableType::AT_AddConstraint = 17
PgQuery::AlterTableType::AT_AddIdentity = 63
PgQuery::AlterTableType::AT_AddIndex = 15
PgQuery::AlterTableType::AT_AddIndexConstraint = 22
PgQuery::AlterTableType::AT_AddInherit = 50
PgQuery::AlterTableType::AT_AddOf = 52
PgQuery::AlterTableType::AT_AlterColumnGenericOptions = 26
PgQuery::AlterTableType::AT_AlterColumnType = 25
PgQuery::AlterTableType::AT_AlterConstraint = 20
PgQuery::AlterTableType::AT_AttachPartition = 60
PgQuery::AlterTableType::AT_ChangeOwner = 27
PgQuery::AlterTableType::AT_CheckNotNull = 8
PgQuery::AlterTableType::AT_ClusterOn = 28
PgQuery::AlterTableType::AT_ColumnDefault = 3
PgQuery::AlterTableType::AT_CookedColumnDefault = 4
PgQuery::AlterTableType::AT_DetachPartition = 61
PgQuery::AlterTableType::AT_DetachPartitionFinalize = 62
PgQuery::AlterTableType::AT_DisableRowSecurity = 56
PgQuery::AlterTableType::AT_DisableRule = 49
PgQuery::AlterTableType::AT_DisableTrig = 41
PgQuery::AlterTableType::AT_DisableTrigAll = 43
PgQuery::AlterTableType::AT_DisableTrigUser = 45
PgQuery::AlterTableType::AT_DropCluster = 29
PgQuery::AlterTableType::AT_DropColumn = 14
PgQuery::AlterTableType::AT_DropConstraint = 23
PgQuery::AlterTableType::AT_DropExpression = 7
PgQuery::AlterTableType::AT_DropIdentity = 65
PgQuery::AlterTableType::AT_DropInherit = 51
PgQuery::AlterTableType::AT_DropNotNull = 5
PgQuery::AlterTableType::AT_DropOf = 53
PgQuery::AlterTableType::AT_DropOids = 32
PgQuery::AlterTableType::AT_EnableAlwaysRule = 47
PgQuery::AlterTableType::AT_EnableAlwaysTrig = 39
PgQuery::AlterTableType::AT_EnableReplicaRule = 48
PgQuery::AlterTableType::AT_EnableReplicaTrig = 40
PgQuery::AlterTableType::AT_EnableRowSecurity = 55
PgQuery::AlterTableType::AT_EnableRule = 46
PgQuery::AlterTableType::AT_EnableTrig = 38
PgQuery::AlterTableType::AT_EnableTrigAll = 42
PgQuery::AlterTableType::AT_EnableTrigUser = 44
PgQuery::AlterTableType::AT_ForceRowSecurity = 57
PgQuery::AlterTableType::AT_GenericOptions = 59
PgQuery::AlterTableType::AT_NoForceRowSecurity = 58
PgQuery::AlterTableType::AT_ReAddComment = 24
PgQuery::AlterTableType::AT_ReAddConstraint = 18
PgQuery::AlterTableType::AT_ReAddDomainConstraint = 19
PgQuery::AlterTableType::AT_ReAddIndex = 16
PgQuery::AlterTableType::AT_ReAddStatistics = 66
PgQuery::AlterTableType::AT_ReplaceRelOptions = 37
PgQuery::AlterTableType::AT_ReplicaIdentity = 54
PgQuery::AlterTableType::AT_ResetOptions = 11
PgQuery::AlterTableType::AT_ResetRelOptions = 36
PgQuery::AlterTableType::AT_SetAccessMethod = 33
PgQuery::AlterTableType::AT_SetCompression = 13
PgQuery::AlterTableType::AT_SetIdentity = 64
PgQuery::AlterTableType::AT_SetLogged = 30
PgQuery::AlterTableType::AT_SetNotNull = 6
PgQuery::AlterTableType::AT_SetOptions = 10
PgQuery::AlterTableType::AT_SetRelOptions = 35
PgQuery::AlterTableType::AT_SetStatistics = 9
PgQuery::AlterTableType::AT_SetStorage = 12
PgQuery::AlterTableType::AT_SetTableSpace = 34
PgQuery::AlterTableType::AT_SetUnLogged = 31
PgQuery::AlterTableType::AT_ValidateConstraint = 21