# Assuming you have predefined categories and inventories
default_category = ProductCategory.find_or_create_by!(name: "Sweets")
default_inventory = ProductInventory.find_or_create_by!(quantity: 100)

# Create doces
# Brigadeiro com granulado
sweet1 = Product.new(
  name: "Brigadeiro com granulado",
  description: "redondo com granulado",
  price: 5,
  product_category: default_category,
  product_inventory: default_inventory
)
sweet1.save!

# Bicho de pé
sweet2 = Product.new(
  name: "Bicho de pé",
  description: "todo bicho tem pé",
  price: 15,
  product_category: default_category,
  product_inventory: default_inventory
)
sweet2.save!

# Beijinho
sweet3 = Product.new(
  name: "Beijinho",
  description: "sou casado",
  price: 25,
  product_category: default_category,
  product_inventory: default_inventory
)
sweet3.save!

# Torta de limão
sweet4 = Product.new(
  name: "Torta de limão",
  description: "para criar um climão",
  price: 35,
  product_category: default_category,
  product_inventory: default_inventory
)
sweet4.save!
