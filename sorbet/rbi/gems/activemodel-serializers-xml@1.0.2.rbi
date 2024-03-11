# typed: true

# DO NOT EDIT MANUALLY
# This is an autogenerated file for types exported from the `activemodel-serializers-xml` gem.
# Please instead update this file by running `bin/tapioca gem activemodel-serializers-xml`.

# source://activemodel-serializers-xml//lib/active_model/serializers/version.rb#1
module ActiveModel
  class << self
    # source://activemodel/7.1.3.2/lib/active_model/deprecator.rb#4
    def deprecator; end

    # source://activemodel-serializers-xml//lib/active_model/serializers.rb#19
    def eager_load!; end

    # source://activemodel/7.1.3.2/lib/active_model/gem_version.rb#5
    def gem_version; end

    # source://activemodel/7.1.3.2/lib/active_model/version.rb#7
    def version; end
  end
end

# source://activemodel-serializers-xml//lib/active_model/serializers/version.rb#2
module ActiveModel::Serializers
  extend ::ActiveSupport::Autoload
end

# source://activemodel-serializers-xml//lib/active_model/serializers/version.rb#3
ActiveModel::Serializers::VERSION = T.let(T.unsafe(nil), String)

# source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#10
module ActiveModel::Serializers::Xml
  include ::ActiveModel::Serialization
  extend ::ActiveSupport::Concern

  mixes_in_class_methods ::ActiveModel::Naming

  # Sets the model +attributes+ from an XML string. Returns +self+.
  #
  #   class Person
  #     include ActiveModel::Serializers::Xml
  #
  #     attr_accessor :name, :age, :awesome
  #
  #     def attributes=(hash)
  #       hash.each do |key, value|
  #         instance_variable_set("@#{key}", value)
  #       end
  #     end
  #
  #     def attributes
  #       instance_values
  #     end
  #   end
  #
  #   xml = { name: 'bob', age: 22, awesome:true }.to_xml
  #   person = Person.new
  #   person.from_xml(xml) # => #<Person:0x007fec5e3b3c40 @age=22, @awesome=true, @name="bob">
  #   person.name          # => "bob"
  #   person.age           # => 22
  #   person.awesome       # => true
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#232
  def from_xml(xml); end

  # Returns XML representing the model. Configuration can be
  # passed through +options+.
  #
  # Without any +options+, the returned XML string will include all the
  # model's attributes.
  #
  #   user = User.find(1)
  #   user.to_xml
  #
  #   <?xml version="1.0" encoding="UTF-8"?>
  #   <user>
  #     <id type="integer">1</id>
  #     <name>David</name>
  #     <age type="integer">16</age>
  #     <created-at type="dateTime">2011-01-30T22:29:23Z</created-at>
  #   </user>
  #
  # The <tt>:only</tt> and <tt>:except</tt> options can be used to limit the
  # attributes included, and work similar to the +attributes+ method.
  #
  # To include the result of some method calls on the model use <tt>:methods</tt>.
  #
  # To include associations use <tt>:include</tt>.
  #
  # For further documentation, see <tt>ActiveRecord::Serialization#to_xml</tt>
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#204
  def to_xml(options = T.unsafe(nil), &block); end
end

# source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#18
class ActiveModel::Serializers::Xml::Serializer
  # @return [Serializer] a new instance of Serializer
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#57
  def initialize(serializable, options = T.unsafe(nil)); end

  # Returns the value of attribute options.
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#55
  def options; end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#66
  def serializable_collection; end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#62
  def serializable_hash; end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#78
  def serialize; end

  private

  # TODO: This can likely be cleaned up to simple use ActiveSupport::XmlMini.to_tag as well.
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#123
  def add_associations(association, records, opts); end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#108
  def add_attributes_and_methods; end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#105
  def add_extra_behavior; end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#116
  def add_includes; end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#166
  def add_procs; end
end

# source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#19
class ActiveModel::Serializers::Xml::Serializer::Attribute
  # @return [Attribute] a new instance of Attribute
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#22
  def initialize(name, serializable, value); end

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#33
  def decorations; end

  # Returns the value of attribute name.
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#20
  def name; end

  # Returns the value of attribute type.
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#20
  def type; end

  # Returns the value of attribute value.
  #
  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#20
  def value; end

  protected

  # source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#43
  def compute_type; end
end

# source://activemodel-serializers-xml//lib/active_model/serializers/xml.rb#52
class ActiveModel::Serializers::Xml::Serializer::MethodAttribute < ::ActiveModel::Serializers::Xml::Serializer::Attribute; end

# source://activemodel-serializers-xml//lib/active_record/serializers/xml_serializer.rb#4
module ActiveRecord
  class << self
    # source://activerecord/7.1.3.2/lib/active_record.rb#342
    def action_on_strict_loading_violation; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#342
    def action_on_strict_loading_violation=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#422
    def allow_deprecated_singular_associations_name; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#422
    def allow_deprecated_singular_associations_name=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#335
    def application_record_class; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#335
    def application_record_class=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#263
    def async_query_executor; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#263
    def async_query_executor=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#317
    def before_committed_on_all_records; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#317
    def before_committed_on_all_records=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#314
    def belongs_to_required_validates_foreign_key; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#314
    def belongs_to_required_validates_foreign_key=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#323
    def commit_transaction_on_non_local_return; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#323
    def commit_transaction_on_non_local_return=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#209
    def db_warnings_action; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#211
    def db_warnings_action=(action); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#236
    def db_warnings_ignore; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#236
    def db_warnings_ignore=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#192
    def default_timezone; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#196
    def default_timezone=(default_timezone); end

    # source://activerecord/7.1.3.2/lib/active_record/deprecator.rb#4
    def deprecator; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#177
    def disable_prepared_statements; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#177
    def disable_prepared_statements=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#476
    def disconnect_all!; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#382
    def dump_schema_after_migration; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#382
    def dump_schema_after_migration=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#392
    def dump_schemas; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#392
    def dump_schemas=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#465
    def eager_load!; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#361
    def error_on_ignored_order; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#361
    def error_on_ignored_order=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record/gem_version.rb#5
    def gem_version; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#454
    def generate_secure_token_on; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#454
    def generate_secure_token_on=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#286
    def global_executor_concurrency; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#278
    def global_executor_concurrency=(global_executor_concurrency); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#266
    def global_thread_pool_async_query_executor; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#290
    def index_nested_attribute_errors; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#290
    def index_nested_attribute_errors=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#183
    def lazily_load_schema_cache; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#183
    def lazily_load_schema_cache=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#245
    def legacy_connection_handling=(_); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#308
    def maintain_test_schema; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#308
    def maintain_test_schema=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#457
    def marshalling_format_version; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#461
    def marshalling_format_version=(value); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#373
    def migration_strategy; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#373
    def migration_strategy=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#425
    def query_transformers; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#425
    def query_transformers=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#305
    def queues; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#305
    def queues=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#440
    def raise_int_wider_than_64bit; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#440
    def raise_int_wider_than_64bit=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#311
    def raise_on_assign_to_attr_readonly; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#311
    def raise_on_assign_to_attr_readonly=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#242
    def reading_role; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#242
    def reading_role=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#320
    def run_after_transaction_callbacks_in_order_defined; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#320
    def run_after_transaction_callbacks_in_order_defined=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#189
    def schema_cache_ignored_tables; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#189
    def schema_cache_ignored_tables=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#353
    def schema_format; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#353
    def schema_format=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#395
    def suppress_multiple_database_warning; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#402
    def suppress_multiple_database_warning=(value); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#367
    def timestamped_migrations; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#367
    def timestamped_migrations=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#432
    def use_yaml_unsafe_load; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#432
    def use_yaml_unsafe_load=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#298
    def verbose_query_logs; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#298
    def verbose_query_logs=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#415
    def verify_foreign_keys_for_fixtures; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#415
    def verify_foreign_keys_for_fixtures=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record/version.rb#7
    def version; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#332
    def warn_on_records_fetched_greater_than; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#332
    def warn_on_records_fetched_greater_than=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#239
    def writing_role; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#239
    def writing_role=(_arg0); end

    # source://activerecord/7.1.3.2/lib/active_record.rb#447
    def yaml_column_permitted_classes; end

    # source://activerecord/7.1.3.2/lib/active_record.rb#447
    def yaml_column_permitted_classes=(_arg0); end
  end
end

# source://activemodel-serializers-xml//lib/active_record/serializers/xml_serializer.rb#5
module ActiveRecord::Serialization
  include GeneratedInstanceMethods
  include ::ActiveModel::Serializers::JSON
  include ::ActiveModel::Serializers::Xml

  mixes_in_class_methods GeneratedClassMethods
  mixes_in_class_methods ::ActiveModel::Naming

  # source://activerecord/7.1.3.2/lib/active_record/serialization.rb#13
  def serializable_hash(options = T.unsafe(nil)); end

  # Builds an XML document to represent the model. Some configuration is
  # available through +options+. However more complicated cases should
  # override ActiveRecord::Base#to_xml.
  #
  # By default the generated XML document will include the processing
  # instruction and all the object's attributes. For example:
  #
  #   <?xml version="1.0" encoding="UTF-8"?>
  #   <topic>
  #     <title>The First Topic</title>
  #     <author-name>David</author-name>
  #     <id type="integer">1</id>
  #     <approved type="boolean">false</approved>
  #     <replies-count type="integer">0</replies-count>
  #     <bonus-time type="dateTime">2000-01-01T08:28:00+12:00</bonus-time>
  #     <written-on type="dateTime">2003-07-16T09:28:00+1200</written-on>
  #     <content>Have a nice day</content>
  #     <author-email-address>david@loudthinking.com</author-email-address>
  #     <parent-id></parent-id>
  #     <last-read type="date">2004-04-15</last-read>
  #   </topic>
  #
  # This behavior can be controlled with <tt>:only</tt>, <tt>:except</tt>,
  # <tt>:skip_instruct</tt>, <tt>:skip_types</tt>, <tt>:dasherize</tt> and <tt>:camelize</tt> .
  # The <tt>:only</tt> and <tt>:except</tt> options are the same as for the
  # +attributes+ method. The default is to dasherize all column names, but you
  # can disable this setting <tt>:dasherize</tt> to +false+. Setting <tt>:camelize</tt>
  # to +true+ will camelize all column names - this also overrides <tt>:dasherize</tt>.
  # To not have the column type included in the XML output set <tt>:skip_types</tt> to +true+.
  #
  # For instance:
  #
  #   topic.to_xml(skip_instruct: true, except: [ :id, :bonus_time, :written_on, :replies_count ])
  #
  #   <topic>
  #     <title>The First Topic</title>
  #     <author-name>David</author-name>
  #     <approved type="boolean">false</approved>
  #     <content>Have a nice day</content>
  #     <author-email-address>david@loudthinking.com</author-email-address>
  #     <parent-id></parent-id>
  #     <last-read type="date">2004-04-15</last-read>
  #   </topic>
  #
  # To include first level associations use <tt>:include</tt>:
  #
  #   firm.to_xml include: [ :account, :clients ]
  #
  #   <?xml version="1.0" encoding="UTF-8"?>
  #   <firm>
  #     <id type="integer">1</id>
  #     <rating type="integer">1</rating>
  #     <name>37signals</name>
  #     <clients type="array">
  #       <client>
  #         <rating type="integer">1</rating>
  #         <name>Summit</name>
  #       </client>
  #       <client>
  #         <rating type="integer">1</rating>
  #         <name>Microsoft</name>
  #       </client>
  #     </clients>
  #     <account>
  #       <id type="integer">1</id>
  #       <credit-limit type="integer">50</credit-limit>
  #     </account>
  #   </firm>
  #
  # Additionally, the record being serialized will be passed to a Proc's second
  # parameter. This allows for ad hoc additions to the resultant document that
  # incorporate the context of the record being serialized. And by leveraging the
  # closure created by a Proc, to_xml can be used to add elements that normally fall
  # outside of the scope of the model -- for example, generating and appending URLs
  # associated with models.
  #
  #   proc = Proc.new { |options, record| options[:builder].tag!('name-reverse', record.name.reverse) }
  #   firm.to_xml procs: [ proc ]
  #
  #   <firm>
  #     # ... normal attributes as shown above ...
  #     <name-reverse>slangis73</name-reverse>
  #   </firm>
  #
  # To include deeper levels of associations pass a hash like this:
  #
  #   firm.to_xml include: {account: {}, clients: {include: :address}}
  #   <?xml version="1.0" encoding="UTF-8"?>
  #   <firm>
  #     <id type="integer">1</id>
  #     <rating type="integer">1</rating>
  #     <name>37signals</name>
  #     <clients type="array">
  #       <client>
  #         <rating type="integer">1</rating>
  #         <name>Summit</name>
  #         <address>
  #           ...
  #         </address>
  #       </client>
  #       <client>
  #         <rating type="integer">1</rating>
  #         <name>Microsoft</name>
  #         <address>
  #           ...
  #         </address>
  #       </client>
  #     </clients>
  #     <account>
  #       <id type="integer">1</id>
  #       <credit-limit type="integer">50</credit-limit>
  #     </account>
  #   </firm>
  #
  # To include any methods on the model being called use <tt>:methods</tt>:
  #
  #   firm.to_xml methods: [ :calculated_earnings, :real_earnings ]
  #
  #   <firm>
  #     # ... normal attributes as shown above ...
  #     <calculated-earnings>100000000000000000</calculated-earnings>
  #     <real-earnings>5</real-earnings>
  #   </firm>
  #
  # To call any additional Procs use <tt>:procs</tt>. The Procs are passed a
  # modified version of the options hash that was given to +to_xml+:
  #
  #   proc = Proc.new { |options| options[:builder].tag!('abc', 'def') }
  #   firm.to_xml procs: [ proc ]
  #
  #   <firm>
  #     # ... normal attributes as shown above ...
  #     <abc>def</abc>
  #   </firm>
  #
  # Alternatively, you can yield the builder object as part of the +to_xml+ call:
  #
  #   firm.to_xml do |xml|
  #     xml.creator do
  #       xml.first_name "David"
  #       xml.last_name "Heinemeier Hansson"
  #     end
  #   end
  #
  #   <firm>
  #     # ... normal attributes as shown above ...
  #     <creator>
  #       <first_name>David</first_name>
  #       <last_name>Heinemeier Hansson</last_name>
  #     </creator>
  #   </firm>
  #
  # As noted above, you may override +to_xml+ in your ActiveRecord::Base
  # subclasses to have complete control about what's generated. The general
  # form of doing this is:
  #
  #   class IHaveMyOwnXML < ActiveRecord::Base
  #     def to_xml(options = {})
  #       require 'builder'
  #       options[:indent] ||= 2
  #       xml = options[:builder] ||= ::Builder::XmlMarkup.new(indent: options[:indent])
  #       xml.instruct! unless options[:skip_instruct]
  #       xml.level_one do
  #         xml.tag!(:second_level, 'content')
  #       end
  #     end
  #   end
  #
  # source://activemodel-serializers-xml//lib/active_record/serializers/xml_serializer.rb#175
  def to_xml(options = T.unsafe(nil), &block); end

  private

  # source://activerecord/7.1.3.2/lib/active_record/serialization.rb#25
  def attribute_names_for_serialization; end

  module GeneratedClassMethods
    def include_root_in_json; end
    def include_root_in_json=(value); end
    def include_root_in_json?; end
  end

  module GeneratedInstanceMethods
    def include_root_in_json; end
    def include_root_in_json?; end
  end
end

# source://activemodel-serializers-xml//lib/active_record/serializers/xml_serializer.rb#180
class ActiveRecord::XmlSerializer < ::ActiveModel::Serializers::Xml::Serializer; end

# source://activemodel-serializers-xml//lib/active_record/serializers/xml_serializer.rb#181
class ActiveRecord::XmlSerializer::Attribute < ::ActiveModel::Serializers::Xml::Serializer::Attribute
  protected

  # source://activemodel-serializers-xml//lib/active_record/serializers/xml_serializer.rb#182
  def compute_type; end
end
