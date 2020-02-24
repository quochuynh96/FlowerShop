using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FlowerShop.Carts;
using System.Globalization;

namespace FlowerShop.Controllers
{
    public class CartController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: Cart
        public ActionResult Index()
        {
            List<Cart> listCart = new List<Cart>();
            if(Session["Cart"] != null)
            {
                listCart = (List <Cart>) Session["Cart"];
            }
            return View("Index",listCart);
        }
        [HttpGet]
        public ActionResult Delete()
        {
            Session.Remove("Cart");
            List<Cart> listCart = new List<Cart>();
            return View("Index", listCart);
        }

        [HttpGet]
        public ActionResult DeleteProduct(int ID)
        {
            List<Cart> listCart = new List<Cart>();
            if (Session["Cart"] != null)
            {
                listCart = (List<Cart>)Session["Cart"];
                foreach(var item in listCart)
                {
                    if(item.Product.Product_ID == ID)
                    {
                        listCart.Remove(item);
                        break;
                    }
                }
                Session["Cart"] = listCart;
            }
            return View("Index", listCart);
        }

        [HttpGet]
        public ContentResult AddNewCartItems(string amount,string productID)
        {
            int am = int.Parse(amount);
            int id = int.Parse(productID);
            var product = (from pro in db.PRODUCTs
                           where pro.Product_ID == id
                           select pro).FirstOrDefault();
            if(Session["Cart"] == null)
            {
                List<Cart> listCart = new List<Cart>();
                Cart cart = new Cart(am, product);
                listCart.Add(cart);
                Session["Cart"] = listCart;
                return Content("Đã thêm " + product.Product_Name + " vào giỏ hàng !");
            }
            else
            {
                List<Cart> listCart = (List<Cart>)Session["Cart"];
                foreach(var item in listCart)
                {
                    if(item.Product.Product_ID == product.Product_ID)
                    {
                        return Content("Sản phẩm " + product.Product_Name + " đã tồn tại trong giỏ hàng, vui lòng vào giỏ hàng để thay đổi số lượng mua !");
                    }
                }
                Cart cart = new Cart(am, product);
                listCart.Add(cart);
                Session["Cart"] = listCart;
                return Content("Đã thêm " + product.Product_Name + " vào giỏ hàng !");
            }
        }
        [HttpGet]
        public ContentResult changeAmountCartItem(string amount, string productID)
        {
            int am = int.Parse(amount);
            int id = int.Parse(productID);
            var product = (from pro in db.PRODUCTs
                           where pro.Product_ID == id
                           select pro).FirstOrDefault();
            if (Session["Cart"] == null)
            {
                return Content("Giỏ hàng rỗng !");
            }
            else
            {
                List<Cart> listCart = (List<Cart>)Session["Cart"];
                foreach (var item in listCart)
                {
                    if (item.Product.Product_ID == product.Product_ID)
                    {
                        item.Amount = am;
                        return Content("Sản phẩm " + product.Product_Name + " đã được cập nhật số lượng thành công !");
                    }
                }
                Session["Cart"] = listCart;
                return Content("Sản phẩm " + product.Product_Name + " không tồn tại trong giỏ hàng !");
            }
        }

        [HttpGet]
        public ContentResult getCountOfCart()
        {
            if(Session["Cart"] == null)
            {
                return Content("0");
            }
            else
            {
                List<Cart> listCart = (List<Cart>)Session["Cart"];
                return Content(listCart.Count.ToString());
            }
        }

        [HttpGet]
        public ContentResult getCountAmountOfCart()
        {
            if (Session["Cart"] == null)
            {
                return Content("0");
            }
            else
            {
                int sum = 0;
                List<Cart> listCart = (List<Cart>)Session["Cart"];
                foreach(var item in listCart)
                {
                    sum += item.Amount;
                }
                return Content(sum.ToString());
            }
        }

        [HttpGet]
        public ContentResult getCountCurOfCart()
        {
            if (Session["Cart"] == null)
            {
                return Content("0");
            }
            else
            {
                int sum = 0;
                List<Cart> listCart = (List<Cart>)Session["Cart"];
                foreach(var item in listCart)
                {
                    sum += item.Amount * (int) item.Product.Product_Price;
                }
                return Content(sum.ToString("C0", CultureInfo.CurrentCulture));
            }
        }
    }
}