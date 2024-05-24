defmodule AshGeo.Test.Domain do
  @moduledoc false

  use Ash.Domain

  resources do
    resource AshGeo.Test.Resource.Constraint
    resource AshGeo.Test.Resource.Validation
    resource AshGeo.Test.Resource.Geom
  end
end
