namespace SolidInventoryApp.DataModel;

public class Order : BaseEntity
{
    public DateTime OrderDate { get; set; }
    public int SupplierId { get; set; }
    public Supplier Supplier { get; set; }
    public int ProductId { get; set; }
    public Product Product { get; set; }
    public int Quantity { get; set; }
    public decimal Price { get; set; }
}