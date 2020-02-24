using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class DetailProductController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: DetailProduct
        public ActionResult Index(int ID)
        {
            var pro = (from p in db.PRODUCTs
                       where p.Product_ID == ID
                       select p).FirstOrDefault();
            return View("Index",pro);
        }
    }
}