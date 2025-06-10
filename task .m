// LINQ Queries on BikeStoreDB

// 1- List all customers' first and last names along with their email addresses
var customers = context.Customers
    .Select(c => new { c.FirstName, c.LastName, c.Email })
    .ToList();

// 2- Retrieve all orders processed by a specific staff member (e.g., staff_id = 3)
var ordersByStaff = context.Orders
    .Where(o => o.StaffId == 3)
    .ToList();

// 3- Get all products that belong to a category named "Mountain Bikes"
var mountainBikes = context.Products
    .Where(p => p.Category.Name == "Mountain Bikes")
    .ToList();

// 4- Count the total number of orders per store
var ordersPerStore = context.Orders
    .GroupBy(o => o.StoreId)
    .Select(g => new { StoreId = g.Key, OrderCount = g.Count() })
    .ToList();

// 5- List all orders that have not been shipped yet (shipped_date is null)
var unshippedOrders = context.Orders
    .Where(o => o.ShippedDate == null)
    .ToList();

// 6- Display each customer’s full name and the number of orders they have placed
var customerOrders = context.Customers
    .Select(c => new {
        FullName = c.FirstName + " " + c.LastName,
        OrderCount = c.Orders.Count()
    })
    .ToList();

// 7- List all products that have never been ordered (not found in order_items)
var neverOrderedProducts = context.Products
    .Where(p => !p.OrderItems.Any())
    .ToList();

// 8- Display products that have a quantity of less than 5 in any store stock
var lowStockProducts = context.Stocks
    .Where(s => s.Quantity < 5)
    .Select(s => s.Product)
    .Distinct()
    .ToList();

// 9- Retrieve the first product from the products table
var firstProduct = context.Products.FirstOrDefault();

// 10- Retrieve all products from the products table with a certain model year
int modelYear = 2023;
var productsByYear = context.Products
    .Where(p => p.ModelYear == modelYear)
    .ToList();

// 11- Display each product with the number of times it was ordered
var productOrderCounts = context.Products
    .Select(p => new {
        p.Name,
        OrderCount = p.OrderItems.Count()
    })
    .ToList();

// 12- Count the number of products in a specific category
int categoryId = 2;
var productCount = context.Products
    .Count(p => p.CategoryId == categoryId);

// 13- Calculate the average list price of products
var avgPrice = context.Products.Average(p => p.ListPrice);

// 14- Retrieve a specific product from the products table by ID
int productId = 101;
var product = context.Products
    .FirstOrDefault(p => p.ProductId == productId);

// 15- List all products that were ordered with a quantity greater than 3 in any order
var highQtyProducts = context.OrderItems
    .Where(oi => oi.Quantity > 3)
    .Select(oi => oi.Product)
    .Distinct()
    .ToList();

// 16- Display each staff member’s name and how many orders they processed
var staffOrders = context.Staffs
    .Select(s => new {
        FullName = s.FirstName + " " + s.LastName,
        OrdersProcessed = s.Orders.Count()
    })
    .ToList();

// 17- List active staff members only (active = true) along with their phone numbers
var activeStaff = context.Staffs
    .Where(s => s.Active)
    .Select(s => new { s.FirstName, s.LastName, s.Phone })
    .ToList();

// 18- List all products with their brand name and category name
var productsInfo = context.Products
    .Select(p => new {
        p.Name,
        BrandName = p.Brand.Name,
        CategoryName = p.Category.Name
    })
    .ToList();

// 19- Retrieve orders that are completed
var completedOrders = context.Orders
    .Where(o => o.Status == 4)
    .ToList();

// 20- List each product with the total quantity sold (sum of quantity from order_items)
var totalSoldPerProduct = context.OrderItems
    .GroupBy(oi => oi.ProductId)
    .Select(g => new {
        ProductId = g.Key,
        TotalQuantitySold = g.Sum(oi => oi.Quantity)
    })
    .ToList();
