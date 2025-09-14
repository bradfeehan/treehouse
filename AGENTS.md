# Treehouse AI Agent Rules

You are an AI assistant helping with the Treehouse project, a real estate analysis platform built with Elixir/Phoenix.

The system aggregates property listings, facility data, and location measurements to help users find ideal places to live.

## Project Context

It's a prototype, so don't over-engineer: we're aiming for the simplest thing that meets requirements.
The main goal of development is as an experiment to gather feedback and iterate quickly.
Things will be thrown away and refactored often as we improve our understanding of the solution space.
However, we do want to consider extensibility in key areas -- particularly providers and measurements.
Designing those extensibility points well is another part of the engineering problem we're exploring and iterating upon.
Given the iterative nature of a prototype, requirements are expected to evolve based on user preferences and feedback.
This can potentially impact the system's design, especially its extensibility points.
Should new features or evolving requirements conflict with existing architectural decisions, it is crucial to
thoroughly analyze the implications and thoughtfully plan necessary adjustments, rather than forcing an unsuitable
fit or disregarding the long-term impact.

### Core Domain
- **Properties**: Real estate listings (sale/rent) with spatial data, pricing, and features
- **Facilities**: Points of interest (schools, parks, cafes) with location and business data
- **Measurements**: Calculated location metrics (distances, noise levels, travel times)
- **Searches**: Configurable queries that periodically fetch data from providers
- **DataSync**: Provider integration for external data sources (Domain, OpenStreetMap, etc.)

### Technology Stack
- **Elixir 1.15+** / **Phoenix 1.7+** - Main application framework
- **PostgreSQL 15+** with **PostGIS** - Database with spatial capabilities
- **Oban** - Background job processing (no Redis, PostgreSQL-based)
- **LiveView** - Interactive web interface, used for highly interactive views
- **Tailwind CSS** - Styling framework

### Architecture Patterns
- **Phoenix Contexts** - Domain-driven design with clear boundaries
- **Provider Pattern** - Plugin-based data source integration
- **Event-Driven** - Background job processing with events
- **Spatial-First** - PostGIS for all location-based operations
- **Plugin Architecture** - Extensible measurement calculations
- **Shift-Left** - Fail-fast, high test coverage, Erlang "let it crash" philosophy
- **Typing** - Be specific with types at inflection points in the code, so it should be impossible to represent invalid states rather than having to validate

## Code Style Guidelines

When upgrading to Elixir 1.19 once it's released, consider its new typing functionality carefully.
It may emit new warnings or errors about new types of type errors it can detect, we can react to those individually.
It may also support expressing new fundamental/primitive constraints in the type system that we could adopt if useful.
As part of that upgrade, (as with all other work in this repo), remove this paragraph once it's no longer relevant.

### Elixir Conventions
- Follow Phoenix idioms and context patterns with clear public APIs
- Use `with` statements for complex operations with multiple failure points
- Prefer explicit error tuples `{:ok, result}` / `{:error, reason}`
- Avoid nested data types e.g. `{:ok, {:ok, result}}`
- Pattern matching is powerful and idiomatic, can be used on function heads for clear control flow
- Use `@spec` for all public functions
- Document modules with `@moduledoc` and functions with `@doc`
- Keep functions focused with single responsibility

### Database Patterns
- Use UUIDs for primary keys (`@primary_key {:id, :binary_id, autogenerate: true}`)
- Always include spatial indexes for location columns (`USING GIST`)
- Use JSONB for flexible/dynamic data storage
- Include `timestamps()` in all schemas
- Use foreign key constraints and unique constraints appropriately

### Dependencies
- Consider if an open source package exists before implementing a significant subsystem
- Use the following sources to find popular dependencies:
    - https://elixirtoolbox.dev
    - https://github.com/h4cc/awesome-elixir
- Not all dependencies are worth using, especially if not very popular, outdated or incomplete, or not so relevant.

### Testing Patterns
- Use ExMachina factories for test data
- Group tests with `describe` blocks
- Test both success and failure cases
- Use `assert` and `refute` appropriately
- Mock external dependencies in tests

## Key File Locations

### Core Contexts
- `lib/treehouse/properties/` - Property management and spatial operations
- `lib/treehouse/facilities/` - Facility data and business logic
- `lib/treehouse/measurements/` - Location measurement calculations
- `lib/treehouse/searches/` - Search configuration and execution
- `lib/treehouse/data_sync/` - Provider integration and data ingestion

### Background Jobs
- `lib/treehouse/workers/` - Oban job workers
- Job types: SearchExecutionJob, DataIngestionJob, MeasurementCalculationJob, CleanupJob

### Database
- `priv/repo/migrations/` - Database migrations
- Always use reversible migrations
- Include spatial indexes for location columns
- Use `concurrently: true` for large table indexes

## Common Patterns

### Context API Functions
```elixir
# Standard CRUD operations
def list_items(filters \\ %{})
def get_item(id)
def create_item(attrs)
def update_item(item, attrs)
def delete_item(item)

# Spatial operations
def items_within_radius(center_point, radius_meters)
def items_in_area(polygon)
def nearest_items(location, item_type, limit \\ 10)
```

### Control Flow
```elixir
# Use with statements for complex operations
with {:ok, validated_data} <- validate_data(data),
     {:ok, item} <- create_item(validated_data),
     {:ok, _result} <- perform_calculation(item) do
  {:ok, item}
else
  {:error, reason} -> {:error, reason}
end
```

Too many extracted methods can obscure the control flow (e.g. `validate_data`, `create_item` above).
When building a `with` block like the above, ideally these private methods aren't calling a myriad of other modules.
The public API should be minimal and simple, with the public method handling fetching data from external modules,
and processing using other modules' public API, together with its own internal private methods.

### Background Jobs
```elixir
# Enqueue jobs with proper error handling
%{item_id: item.id, operation: "calculate"}
|> MyWorker.new()
|> Oban.insert()
```

### Spatial Queries
```elixir
# Use PostGIS functions for spatial operations
from(p in Property,
  where: st_dwithin(p.location, ^point, ^radius_meters),
  order_by: st_distance(p.location, ^point)
)
```

## Provider Integration

### When creating new providers:

- A common behaviour `Treehouse.DataSync.Provider` is implemented by all providers.
- There should be a set of tests that run across all providers, testing functionality that they all have in common.
- They would also test any expectations and invariants etc. that should apply to any provider.
- When implementing a new provider, there are probably also provider-specific functionality that should also be tested.
- Fetching, parsing, and validation should be done in a fail-fast, shift-left, test-driven, highly unit-tested manner.
- Cross-cutting concerns (e.g. rate limiting) can be implemented in modules, to be used and configured by each provider.
- Error handling should be structured and consistent across providers. Errors can be classed as retriable or not.

### Provider Structure
```elixir
defmodule Treehouse.DataSync.Providers.MyProvider do
  @behaviour Treehouse.DataSync.Provider

  def name(), do: "my_provider"
  def supports(), do: [:properties] # or [:facilities]
  def rate_limit(), do: %{requests_per_minute: 60, burst_size: 5}
  def fetch(search_params), do: # Implementation
  def parse(raw_data, search_params), do: # Implementation
end
```

This is just an initial first version. Like everything else, if at any time it's determined that this is not an
idiomatic or ideal way to structure a point of extensibility in Elixir/OTP, consider making the change -- it's early in
the prototype phase.

This structure in particular, at least at the time of writing, I'm really not sure if it's a great way to do it.
For example, the `name()` method returning a string, should it be an enumeration, or module name, or is it not worth it?
Also, no typing at all... search_params especially, I think it would be a nightmare to manage that without being typed?

## Testing Guidelines

### Test driven development philosophy

When writing a feature, always ensure it's fully tested from the start.
For any reasonably sized piece of functionality or bug fix, create a branch from latest `main` and:

- Write a test for the new functionality, and run it to make sure it fails
- Commit that and then work on the feature or change
- Write other lower-level tests along the way for each small testable part
- Repeat (check the test fails before implementing, do implementation and check it passes, commit)
- When the overall test passes, the work should be complete
- That test should be written in a way that it will fail if the functionality ever went away or doesn't work
- All bugfixes have a corresponding regression test which fails on `main`, but passes after the bug is fixed.

Only update test files themselves (i.e. changing what is being tested) if the test is actually no longer valid based on the changes we are making. Don't just make changes to tests to get them to pass without knowing why. In that case, consider keeping the test but inverted, if the inverse behaviour is the new desired behaviour.


### Test Organization
- Testing pyramid philosophy: lots of fast unit tests with mocks, fewer thorough integration tests
- At the top of the pyramid, a key set of comprehensive end-to-end acceptance tests ensure all features work
- Use `describe` blocks to group related tests
- Test both success and error paths
- Use factories for consistent test data
- Mock external dependencies (HTTP calls, APIs) accurately

### Factory Patterns
```elixir
def property_factory do
  %Treehouse.Properties.Property{
    external_id: sequence(:external_id, &"prop_#{&1}"),
    provider_name: "test_provider",
    location: %Geo.Point{coordinates: {151.2093, -33.8688}, srid: 4326},
    # ... other required fields
  }
end
```

## Performance Considerations

### Database Optimization
- Use spatial indexes for all location-based queries
- Preload associations to avoid N+1 queries
- Use `Repo.stream/1` for large datasets
- Consider materialized views for complex analytics

### Memory Management
- Stream large datasets instead of loading into memory
- Use `Stream.chunk_every/2` for batch processing
- Consider pagination for large result sets

## Security Guidelines

### Input Validation
- Always validate user input with changesets
- Use parameterized queries to prevent SQL injection
- Validate spatial data coordinates and bounds
- Sanitize text fields to prevent XSS

### API Security
- Implement rate limiting for public endpoints
- Use proper authentication for API access
- Validate and sanitize all API inputs
- Log security-related events

## Common Commands

### Development
- `mix setup` - Initial project setup
- `mix phx.server` - Start development server (note: always check if it's already running, by accessing localhost:4000 either by curl or browser)
- `mix test` - Run tests
- `mix quality` - Run formatter, Credo, and Dialyzer

### Database
- `mix ecto.create` - Create database
- `mix ecto.migrate` - Run migrations
- `mix ecto.rollback` - Rollback migrations
- `mix ecto.gen.migration` - Generate migration

### Background Jobs
- Jobs are automatically processed by Oban
- Use Oban Web for monitoring job queues
- Jobs are stored in PostgreSQL (saves adding an additional external dependency)

## Important Notes

### Spatial Data
- Always use SRID 4326 (WGS84) for coordinate storage
- Use PostGIS functions for spatial calculations
- Include spatial indexes on all location columns
- Validate coordinate bounds (-180 to 180 for longitude, -90 to 90 for latitude)

### Provider Data
- All external data goes through provider interfaces
- Raw provider data is stored for debugging/reprocessing, cleaned up after a time
- Parsed data is normalized to common schemas
- Handle rate limiting and API failures gracefully

### Background Processing
- Use appropriate job queues (critical, high_priority, normal, low_priority)
- Jobs should always be idempotent
- Include proper error handling and retry logic
- Job performance and failure rates can be monitored with standard included tools

### Documentation
- Keep architectural documents up to date, including this one
- Document all public API functions
- Include examples in documentation
- Use doctests for testable examples

Remember: This is a prototype real estate analysis platform focused on helping users find ideal places to live through comprehensive data aggregation and analysis.
