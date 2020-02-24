using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class HomeController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        public ActionResult Index()
        {
            var listProduct = (from pro in db.PRODUCTs
                               where pro.Product_Status == 1
                               select pro).ToList();
            return View("Index",listProduct);
        }

        [HttpGet]
        public ActionResult FilterByCategories(int CtID)
        {
            var listProduct = (from pro in db.PRODUCTs
                               where ((pro.Product_Status == 1)&&pro.Categories_ID == CtID)
                               select pro).ToList();
            return View("Index", listProduct);
        }
        [HttpGet]
        public ActionResult Search(string keyword)
        {
            if(keyword.Length == 0)
            {
                var listProduct = (from pro in db.PRODUCTs
                                   where ((pro.Product_Status == 1))
                                   select pro).ToList();
                return View("Index", listProduct);
            }
            else
            {
                var listProduct = (from pro in db.PRODUCTs
                                   where ((pro.Product_Status == 1) && (pro.Product_Name.ToLower().Contains(keyword.ToLower())))
                                   select pro).ToList();
                return View("Index", listProduct);
            }
            
        }
        [HttpGet]
        public ActionResult Logout()
        {
            ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Đăng xuất thành công !</div>";
            var listProduct = (from pro in db.PRODUCTs
                               where pro.Product_Status == 1
                               select pro).ToList();
            Session.Remove("Customers");
            return View("Index", listProduct);
        }

        public ActionResult About()
        {
            ViewBag.Message = "Your application description page.";

            return View();
        }

        public ActionResult Contact()
        {
            ViewBag.Message = "Your contact page.";

            return View();
        }
    }
}