# GraphQL.execute(TestSchema.schema, "{working {name}}")
# GraphQL.execute(TestSchema.schema, "{notWorking {name}}")

defmodule TestSchema do
  def schema do
    %GraphQL.Schema{
      query: %GraphQL.Type.ObjectType{
        name: "RootQueryType",
        fields: %{
          working: %{
            type: User.type,
            resolve: %{name: "Ted"}
          },
          # should return map, instead it returns null
          notWorking: %{
            type: User.type,
            resolve: %{"name" => "Bob"}
          }
        }
      }
    }
  end
end


defmodule User do
  def type() do
    %GraphQL.Type.ObjectType{
      name: "User",
      description: "A generic User",
      fields: %{
        name: %{type: %GraphQL.Type.String{}},
      }
    }
  end
end
