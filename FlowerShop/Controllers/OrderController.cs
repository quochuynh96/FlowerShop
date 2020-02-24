using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using FlowerShop.Carts;
using System.Globalization;
using FlowerShop.Helper;

namespace FlowerShop.Controllers
{
    public class OrderController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        
        // GET: Order
        public ActionResult Index()
        {
            if (Session["Customers"] == null)
            {
                return View("~/Views/Login/Login.cshtml");
            }
            if (Session["Cart"] == null)
            {
                var listProduct = (from pro in db.PRODUCTs
                                   where pro.Product_Status == 1
                                   select pro).ToList();
                return View("~/Views/Home/Index.cshtml", listProduct);
            }
            CUSTOMER cus = (CUSTOMER)Session["Customers"];
            if (Session["Cart"] == null)
            {
                ViewData["getCountCurOfCart"] = "0";
            }
            else
            {
                int sum = 0;
                List<Cart> listCart = (List<Cart>)Session["Cart"];
                foreach (var item in listCart)
                {
                    sum += item.Amount * (int)item.Product.Product_Price;
                }
                ViewData["getCountCurOfCart"] = sum.ToString("C0", CultureInfo.CurrentCulture);
            }
            return View("OrderConfirm", cus);
        }

        [HttpPost]
        public ActionResult AddNewOrder(FormCollection form)
        {
            CUSTOMER cus = (CUSTOMER)Session["Customers"];
            ORDER order = new ORDER();
            DateTime d = DateTime.Now;
            order.Orders_Date = d;
            order.Customers_ID = cus.Customers_ID;
            order.Status = 0;
            order.Note = form["Note"];
            order.Payment_Method = byte.Parse(form["Payment_Method"]);
            order.Payment_Status = 0;
            db.ORDERS.Add(order);
            db.SaveChanges();

            List<Cart> listCart = (List<Cart>)Session["Cart"];

            foreach (var item in listCart)
            {
                ORDERS_DETAIL od = new ORDERS_DETAIL();
                od.Orders_ID = order.Orders_ID;
                od.Product_ID = item.Product.Product_ID;
                od.Product_Num = item.Amount;
                db.ORDERS_DETAIL.Add(od);
                var pro = (from p in db.PRODUCTs
                           where p.Product_ID == item.Product.Product_ID
                           select p).FirstOrDefault();
                pro.Product_Stock_Quantity = pro.Product_Stock_Quantity - item.Amount;
            }
            db.SaveChanges();
            
            if(form["Payment_Method"].CompareTo("1")==0)
            {
                return View("PaymentGuide", order);
            }

            ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Đặt hàng thành công !</div>";
            Session.Remove("Cart");
            var listProduct = (from pro in db.PRODUCTs
                               where pro.Product_Status == 1
                               select pro).ToList();
            return View("~/Views/Home/Index.cshtml", listProduct);
        }

        [HttpGet]
        public ActionResult getListOrder()
        {
            if (Session["Customers"] == null)
            {
                return View("~/Views/Login/Login.cshtml");
            }
            CUSTOMER cus = (CUSTOMER)Session["Customers"];
            if(cus.Customers_Name.CompareTo("Admin")==0)
            {
                List<ORDER> listOrder = db.ORDERS.ToList();
                return View("OrderList", listOrder);
            }
            else
            {
                List<ORDER> listOrder = (from od in db.ORDERS
                                         where od.Customers_ID == cus.Customers_ID
                                         select od).ToList() ;
                return View("OrderList", listOrder);
            }
        }
        [HttpGet]
        public ActionResult ChangeOrderStatus(int ID,byte code)
        {
            if (Session["Customers"] == null)
            {
                return View("~/Views/Login/Login.cshtml");
            }
            var order = (from or in db.ORDERS
                         where or.Orders_ID == ID
                         select or).FirstOrDefault();
            order.Status = code;
            if(code == 5)
            {

                var listDetail = (from or in db.ORDERS_DETAIL
                                  where or.Orders_ID == ID
                                  select or).ToList();
                foreach(var item in listDetail)
                {
                    var pro = (from p in db.PRODUCTs
                               where p.Product_ID == item.Product_ID
                               select p).FirstOrDefault();
                    pro.Product_Stock_Quantity = pro.Product_Stock_Quantity + item.Product_Num;
                }
            }
            db.SaveChanges();
            CUSTOMER cus = (CUSTOMER)Session["Customers"];
            if (cus.Customers_Name.CompareTo("Admin") == 0)
            {
                List<ORDER> listOrder = db.ORDERS.ToList();
                return View("OrderList", listOrder);
            }
            else
            {
                List<ORDER> listOrder = (from od in db.ORDERS
                                         where od.Customers_ID == cus.Customers_ID
                                         select od).ToList();
                return View("OrderList", listOrder);
            }
        }
        [HttpGet]
        public ContentResult getTotalCur()
        {
            long sum = 0;
            foreach(var item in db.ORDERS.ToList())
            {
                if(item.Status == 2)
                {
                    foreach(var items in db.ORDERS_DETAIL.ToList())
                    {
                        sum += (int)items.PRODUCT.Product_Price * (int)items.Product_Num;
                    }
                }
            }
            return Content("Tổng doanh thu : "+sum.ToString("C0", CultureInfo.CurrentCulture)+" VNĐ");
        }
    }
}