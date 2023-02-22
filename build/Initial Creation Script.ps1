# Define the application name and project structure
$AppName = "SolidInventoryApp"
$ProjectRoot = ".\$AppName"
$DataModelDir = "$ProjectRoot\DataModel"
$DataAccessDir = "$ProjectRoot\DataAccess"

# Create the project directory structure
New-Item -ItemType Directory -Path $ProjectRoot | Out-Null
New-Item -ItemType Directory -Path $DataModelDir | Out-Null
New-Item -ItemType Directory -Path $DataAccessDir | Out-Null

# Create the required code files
$InventoryItemContent = @"
namespace $AppName.DataModel
{
    public class InventoryItem
    {
        // TODO: Define the InventoryItem class properties
    }
}
"@
New-Item -ItemType File -Path "$DataModelDir\InventoryItem.cs" | Out-Null
Set-Content -Path "$DataModelDir\InventoryItem.cs" -Value $InventoryItemContent

$OrderContent = @"
namespace $AppName.DataModel
{
    public class Order
    {
        // TODO: Define the Order class properties
    }
}
"@
New-Item -ItemType File -Path "$DataModelDir\Order.cs" | Out-Null
Set-Content -Path "$DataModelDir\Order.cs" -Value $OrderContent

$ProductContent = @"
namespace $AppName.DataModel
{
    public class Product
    {
        // TODO: Define the Product class properties
    }
}
"@
New-Item -ItemType File -Path "$DataModelDir\Product.cs" | Out-Null
Set-Content -Path "$DataModelDir\Product.cs" -Value $ProductContent

$IRepositoryContent = @"
namespace $AppName.DataAccess
{
    public interface IRepository<T>
    {
        IEnumerable<T> GetAll();
        T GetById(int id);
        void Add(T entity);
        void Update(T entity);
        void Delete(int id);
    }
}
"@
New-Item -ItemType File -Path "$DataAccessDir\IRepository.cs" | Out-Null
Set-Content -Path "$DataAccessDir\IRepository.cs" -Value $IRepositoryContent

$RepositoryContent = @"
namespace $AppName.DataAccess
{
    public class Repository<T> : IRepository<T> where T : class
    {
        // TODO: Implement IRepository<T> methods using Entity Framework
    }
}
"@
New-Item -ItemType File -Path "$DataAccessDir\Repository.cs" | Out-Null
Set-Content -Path "$DataAccessDir\Repository.cs" -Value $RepositoryContent
