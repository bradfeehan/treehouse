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
- Use the already included and available `:req` (`Req`) library for HTTP requests, **avoid** `:httpoison`, `:tesla`, and `:httpc`. Req is included by default and is the preferred HTTP client for Phoenix apps


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
- Use `bin/pre-commit` before every commit, and fix any detected issues before committing
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

## Phoenix v1.18 guidelines

This is a web application written using the Phoenix web framework.

- **Always** begin your LiveView templates with `<Layouts.app flash={@flash} ...>` which wraps all inner content
- The `MyAppWeb.Layouts` module is aliased in the `my_app_web.ex` file, so you can use it without needing to alias it again
- Anytime you run into errors with no `current_scope` assign:
  - You failed to follow the Authenticated Routes guidelines, or you failed to pass `current_scope` to `<Layouts.app>`
  - **Always** fix the `current_scope` error by moving your routes to the proper `live_session` and ensure you pass `current_scope` as needed
- Phoenix v1.8 moved the `<.flash_group>` component to the `Layouts` module. You are **forbidden** from calling `<.flash_group>` outside of the `layouts.ex` module
- Out of the box, `core_components.ex` imports an `<.icon name="hero-x-mark" class="w-5 h-5"/>` component for for hero icons. **Always** use the `<.icon>` component for icons, **never** use `Heroicons` modules or similar
- **Always** use the imported `<.input>` component for form inputs from `core_components.ex` when available. `<.input>` is imported and using it will will save steps and prevent errors
- If you override the default input classes (`<.input class="myclass px-2 py-1 rounded-lg">)`) class with your own values, no default classes are inherited, so your
custom classes must fully style the input

### JS and CSS guidelines

- **Use Tailwind CSS classes and custom CSS rules** to create polished, responsive, and visually stunning interfaces.
- Tailwindcss v4 **no longer needs a tailwind.config.js** and uses a new import syntax in `app.css`:

      @import "tailwindcss" source(none);
      @source "../css";
      @source "../js";
      @source "../../lib/my_app_web";

- **Always use and maintain this import syntax** in the app.css file for projects generated with `phx.new`
- **Never** use `@apply` when writing raw css
- **Always** manually write your own tailwind-based components instead of using daisyUI for a unique, world-class design
- Out of the box **only the app.js and app.css bundles are supported**
  - You cannot reference an external vendor'd script `src` or link `href` in the layouts
  - You must import the vendor deps into app.js and app.css to use them
  - **Never write inline <script>custom js</script> tags within templates**

### UI/UX & design guidelines

- **Produce world-class UI designs** with a focus on usability, aesthetics, and modern design principles
- Implement **subtle micro-interactions** (e.g., button hover effects, and smooth transitions)
- Ensure **clean typography, spacing, and layout balance** for a refined, premium look
- Focus on **delightful details** like hover effects, loading states, and smooth page transitions


<!-- usage-rules-start -->

<!-- phoenix:elixir-start -->
## Elixir guidelines

- Elixir lists **do not support index based access via the access syntax**

  **Never do this (invalid)**:

      i = 0
      mylist = ["blue", "green"]
      mylist[i]

  Instead, **always** use `Enum.at`, pattern matching, or `List` for index based list access, ie:

      i = 0
      mylist = ["blue", "green"]
      Enum.at(mylist, i)

- Elixir variables are immutable, but can be rebound, so for block expressions like `if`, `case`, `cond`, etc
  you *must* bind the result of the expression to a variable if you want to use it and you CANNOT rebind the result inside the expression, ie:

      # INVALID: we are rebinding inside the `if` and the result never gets assigned
      if connected?(socket) do
        socket = assign(socket, :val, val)
      end

      # VALID: we rebind the result of the `if` to a new variable
      socket =
        if connected?(socket) do
          assign(socket, :val, val)
        end

- **Never** nest multiple modules in the same file as it can cause cyclic dependencies and compilation errors
- **Never** use map access syntax (`changeset[:field]`) on structs as they do not implement the Access behaviour by default. For regular structs, you **must** access the fields directly, such as `my_struct.field` or use higher level APIs that are available on the struct if they exist, `Ecto.Changeset.get_field/2` for changesets
- Elixir's standard library has everything necessary for date and time manipulation. Familiarize yourself with the common `Time`, `Date`, `DateTime`, and `Calendar` interfaces by accessing their documentation as necessary. **Never** install additional dependencies unless asked or for date/time parsing (which you can use the `date_time_parser` package)
- Don't use `String.to_atom/1` on user input (memory leak risk)
- Predicate function names should not start with `is_` and should end in a question mark. Names like `is_thing` should be reserved for guards
- Elixir's builtin OTP primitives like `DynamicSupervisor` and `Registry`, require names in the child spec, such as `{DynamicSupervisor, name: MyApp.MyDynamicSup}`, then you can use `DynamicSupervisor.start_child(MyApp.MyDynamicSup, child_spec)`
- Use `Task.async_stream(collection, callback, options)` for concurrent enumeration with back-pressure. The majority of times you will want to pass `timeout: :infinity` as option

## Mix guidelines

- Read the docs and options before using tasks (by using `mix help task_name`)
- To debug test failures, run tests in a specific file with `mix test test/my_test.exs` or run all previously failed tests with `mix test --failed`
- `mix deps.clean --all` is **almost never needed**. **Avoid** using it unless you have good reason
<!-- phoenix:elixir-end -->

<!-- phoenix:phoenix-start -->
## Phoenix guidelines

- Remember Phoenix router `scope` blocks include an optional alias which is prefixed for all routes within the scope. **Always** be mindful of this when creating routes within a scope to avoid duplicate module prefixes.

- You **never** need to create your own `alias` for route definitions! The `scope` provides the alias, ie:

      scope "/admin", AppWeb.Admin do
        pipe_through :browser

        live "/users", UserLive, :index
      end

  the UserLive route would point to the `AppWeb.Admin.UserLive` module

- `Phoenix.View` no longer is needed or included with Phoenix, don't use it
<!-- phoenix:phoenix-end -->

<!-- phoenix:ecto-start -->
## Ecto Guidelines

- **Always** preload Ecto associations in queries when they'll be accessed in templates, ie a message that needs to reference the `message.user.email`
- Remember `import Ecto.Query` and other supporting modules when you write `seeds.exs`
- `Ecto.Schema` fields always use the `:string` type, even for `:text`, columns, ie: `field :name, :string`
- `Ecto.Changeset.validate_number/2` **DOES NOT SUPPORT the `:allow_nil` option**. By default, Ecto validations only run if a change for the given field exists and the change value is not nil, so such as option is never needed
- You **must** use `Ecto.Changeset.get_field(changeset, :field)` to access changeset fields
- Fields which are set programatically, such as `user_id`, must not be listed in `cast` calls or similar for security purposes. Instead they must be explicitly set when creating the struct
<!-- phoenix:ecto-end -->

<!-- phoenix:html-start -->
## Phoenix HTML guidelines

- Phoenix templates **always** use `~H` or .html.heex files (known as HEEx), **never** use `~E`
- **Always** use the imported `Phoenix.Component.form/1` and `Phoenix.Component.inputs_for/1` function to build forms. **Never** use `Phoenix.HTML.form_for` or `Phoenix.HTML.inputs_for` as they are outdated
- When building forms **always** use the already imported `Phoenix.Component.to_form/2` (`assign(socket, form: to_form(...))` and `<.form for={@form} id="msg-form">`), then access those forms in the template via `@form[:field]`
- **Always** add unique DOM IDs to key elements (like forms, buttons, etc) when writing templates, these IDs can later be used in tests (`<.form for={@form} id="product-form">`)
- For "app wide" template imports, you can import/alias into the `my_app_web.ex`'s `html_helpers` block, so they will be available to all LiveViews, LiveComponent's, and all modules that do `use MyAppWeb, :html` (replace "my_app" by the actual app name)

- Elixir supports `if/else` but **does NOT support `if/else if` or `if/elsif`. **Never use `else if` or `elseif` in Elixir**, **always** use `cond` or `case` for multiple conditionals.

  **Never do this (invalid)**:

      <%= if condition do %>
        ...
      <% else if other_condition %>
        ...
      <% end %>

  Instead **always** do this:

      <%= cond do %>
        <% condition -> %>
          ...
        <% condition2 -> %>
          ...
        <% true -> %>
          ...
      <% end %>

- HEEx require special tag annotation if you want to insert literal curly's like `{` or `}`. If you want to show a textual code snippet on the page in a `<pre>` or `<code>` block you *must* annotate the parent tag with `phx-no-curly-interpolation`:

      <code phx-no-curly-interpolation>
        let obj = {key: "val"}
      </code>

  Within `phx-no-curly-interpolation` annotated tags, you can use `{` and `}` without escaping them, and dynamic Elixir expressions can still be used with `<%= ... %>` syntax

- HEEx class attrs support lists, but you must **always** use list `[...]` syntax. You can use the class list syntax to conditionally add classes, **always do this for multiple class values**:

      <a class={[
        "px-2 text-white",
        @some_flag && "py-5",
        if(@other_condition, do: "border-red-500", else: "border-blue-100"),
        ...
      ]}>Text</a>

  and **always** wrap `if`'s inside `{...}` expressions with parens, like done above (`if(@other_condition, do: "...", else: "...")`)

  and **never** do this, since it's invalid (note the missing `[` and `]`):

      <a class={
        "px-2 text-white",
        @some_flag && "py-5"
      }> ...
      => Raises compile syntax error on invalid HEEx attr syntax

- **Never** use `<% Enum.each %>` or non-for comprehensions for generating template content, instead **always** use `<%= for item <- @collection do %>`
- HEEx HTML comments use `<%!-- comment --%>`. **Always** use the HEEx HTML comment syntax for template comments (`<%!-- comment --%>`)
- HEEx allows interpolation via `{...}` and `<%= ... %>`, but the `<%= %>` **only** works within tag bodies. **Always** use the `{...}` syntax for interpolation within tag attributes, and for interpolation of values within tag bodies. **Always** interpolate block constructs (if, cond, case, for) within tag bodies using `<%= ... %>`.

  **Always** do this:

      <div id={@id}>
        {@my_assign}
        <%= if @some_block_condition do %>
          {@another_assign}
        <% end %>
      </div>

  and **Never** do this – the program will terminate with a syntax error:

      <%!-- THIS IS INVALID NEVER EVER DO THIS --%>
      <div id="<%= @invalid_interpolation %>">
        {if @invalid_block_construct do}
        {end}
      </div>
<!-- phoenix:html-end -->

<!-- phoenix:liveview-start -->
## Phoenix LiveView guidelines

- **Never** use the deprecated `live_redirect` and `live_patch` functions, instead **always** use the `<.link navigate={href}>` and  `<.link patch={href}>` in templates, and `push_navigate` and `push_patch` functions LiveViews
- **Avoid LiveComponent's** unless you have a strong, specific need for them
- LiveViews should be named like `AppWeb.WeatherLive`, with a `Live` suffix. When you go to add LiveView routes to the router, the default `:browser` scope is **already aliased** with the `AppWeb` module, so you can just do `live "/weather", WeatherLive`
- Remember anytime you use `phx-hook="MyHook"` and that js hook manages its own DOM, you **must** also set the `phx-update="ignore"` attribute
- **Never** write embedded `<script>` tags in HEEx. Instead always write your scripts and hooks in the `assets/js` directory and integrate them with the `assets/js/app.js` file

### LiveView streams

- **Always** use LiveView streams for collections for assigning regular lists to avoid memory ballooning and runtime termination with the following operations:
  - basic append of N items - `stream(socket, :messages, [new_msg])`
  - resetting stream with new items - `stream(socket, :messages, [new_msg], reset: true)` (e.g. for filtering items)
  - prepend to stream - `stream(socket, :messages, [new_msg], at: -1)`
  - deleting items - `stream_delete(socket, :messages, msg)`

- When using the `stream/3` interfaces in the LiveView, the LiveView template must 1) always set `phx-update="stream"` on the parent element, with a DOM id on the parent element like `id="messages"` and 2) consume the `@streams.stream_name` collection and use the id as the DOM id for each child. For a call like `stream(socket, :messages, [new_msg])` in the LiveView, the template would be:

      <div id="messages" phx-update="stream">
        <div :for={{id, msg} <- @streams.messages} id={id}>
          {msg.text}
        </div>
      </div>

- LiveView streams are *not* enumerable, so you cannot use `Enum.filter/2` or `Enum.reject/2` on them. Instead, if you want to filter, prune, or refresh a list of items on the UI, you **must refetch the data and re-stream the entire stream collection, passing reset: true**:

      def handle_event("filter", %{"filter" => filter}, socket) do
        # re-fetch the messages based on the filter
        messages = list_messages(filter)

        {:noreply,
        socket
        |> assign(:messages_empty?, messages == [])
        # reset the stream with the new messages
        |> stream(:messages, messages, reset: true)}
      end

- LiveView streams *do not support counting or empty states*. If you need to display a count, you must track it using a separate assign. For empty states, you can use Tailwind classes:

      <div id="tasks" phx-update="stream">
        <div class="hidden only:block">No tasks yet</div>
        <div :for={{id, task} <- @stream.tasks} id={id}>
          {task.name}
        </div>
      </div>

  The above only works if the empty state is the only HTML block alongside the stream for-comprehension.

- **Never** use the deprecated `phx-update="append"` or `phx-update="prepend"` for collections

### LiveView tests

- `Phoenix.LiveViewTest` module and `LazyHTML` (included) for making your assertions
- Form tests are driven by `Phoenix.LiveViewTest`'s `render_submit/2` and `render_change/2` functions
- Come up with a step-by-step test plan that splits major test cases into small, isolated files. You may start with simpler tests that verify content exists, gradually add interaction tests
- **Always reference the key element IDs you added in the LiveView templates in your tests** for `Phoenix.LiveViewTest` functions like `element/2`, `has_element/2`, selectors, etc
- **Never** tests again raw HTML, **always** use `element/2`, `has_element/2`, and similar: `assert has_element?(view, "#my-form")`
- Instead of relying on testing text content, which can change, favor testing for the presence of key elements
- Focus on testing outcomes rather than implementation details
- Be aware that `Phoenix.Component` functions like `<.form>` might produce different HTML than expected. Test against the output HTML structure, not your mental model of what you expect it to be
- When facing test failures with element selectors, add debug statements to print the actual HTML, but use `LazyHTML` selectors to limit the output, ie:

      html = render(view)
      document = LazyHTML.from_fragment(html)
      matches = LazyHTML.filter(document, "your-complex-selector")
      IO.inspect(matches, label: "Matches")

### Form handling

#### Creating a form from params

If you want to create a form based on `handle_event` params:

    def handle_event("submitted", params, socket) do
      {:noreply, assign(socket, form: to_form(params))}
    end

When you pass a map to `to_form/1`, it assumes said map contains the form params, which are expected to have string keys.

You can also specify a name to nest the params:

    def handle_event("submitted", %{"user" => user_params}, socket) do
      {:noreply, assign(socket, form: to_form(user_params, as: :user))}
    end

#### Creating a form from changesets

When using changesets, the underlying data, form params, and errors are retrieved from it. The `:as` option is automatically computed too. E.g. if you have a user schema:

    defmodule MyApp.Users.User do
      use Ecto.Schema
      ...
    end

And then you create a changeset that you pass to `to_form`:

    %MyApp.Users.User{}
    |> Ecto.Changeset.change()
    |> to_form()

Once the form is submitted, the params will be available under `%{"user" => user_params}`.

In the template, the form form assign can be passed to the `<.form>` function component:

    <.form for={@form} id="todo-form" phx-change="validate" phx-submit="save">
      <.input field={@form[:field]} type="text" />
    </.form>

Always give the form an explicit, unique DOM ID, like `id="todo-form"`.

#### Avoiding form errors

**Always** use a form assigned via `to_form/2` in the LiveView, and the `<.input>` component in the template. In the template **always access forms this**:

    <%!-- ALWAYS do this (valid) --%>
    <.form for={@form} id="my-form">
      <.input field={@form[:field]} type="text" />
    </.form>

And **never** do this:

    <%!-- NEVER do this (invalid) --%>
    <.form for={@changeset} id="my-form">
      <.input field={@changeset[:field]} type="text" />
    </.form>

- You are FORBIDDEN from accessing the changeset in the template as it will cause errors
- **Never** use `<.form let={f} ...>` in the template, instead **always use `<.form for={@form} ...>`**, then drive all form references from the form assign as in `@form[:field]`. The UI should **always** be driven by a `to_form/2` assigned in the LiveView module that is derived from a changeset
<!-- phoenix:liveview-end -->

<!-- usage-rules-end -->

Remember: This is a prototype real estate analysis platform focused on helping users find ideal places to live through comprehensive data aggregation and analysis.
