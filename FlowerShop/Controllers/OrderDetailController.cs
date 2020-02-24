using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class OrderDetailController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: OrderDetail
        public ActionResult Index()
        {
            var listDetail = db.ORDERS_DETAIL.ToList();
            return View("ListOrderDetail",listDetail);
        }
        [HttpGet]
        public ActionResult getListOrderDetail(int Order_ID)
        {
            var listDetail = (from od in db.ORDERS_DETAIL
                              where od.Orders_ID == Order_ID
                              select od).ToList();
            var order = (from d in db.ORDERS
                         where d.Orders_ID == Order_ID
                         select d).FirstOrDefault();
            ViewData["Order_ID"] = Order_ID;
            ViewData["Order"] = order;
            return View("ListOrderDetail", listDetail);
        }
    }
}