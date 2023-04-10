defmodule StoreManager.Business.Clerk do
  use Ecto.Schema
  import Ecto.Changeset

  alias StoreManager.Business.Company

  schema "clerks" do
    field :name, :string
    belongs_to :company, Company

    timestamps()
  end

  @doc false
  def changeset(clerk, attrs) do
    clerk
    |> cast(attrs, [:name, :company_id])
    |> validate_required([:name, :company_id])
  end
end
