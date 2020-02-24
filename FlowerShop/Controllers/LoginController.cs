using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class LoginController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: Login
        public ActionResult Index()
        {
            return View("Login");
        }
        [HttpPost]
        public ActionResult CheckLogin(FormCollection form)
        {
            string CusEmail = form["Customers_Email"];
            string CusPass =form["Customers_Password"];
            var Customers = (from cus in db.CUSTOMERS
                            where cus.Customers_Email.ToLower().CompareTo(CusEmail.ToLower()) == 0
                            select cus).FirstOrDefault();
            if(Customers == null)
            {
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Email chưa được đăng ký !</div>";
                return View("Login");
            }
            else
            {
               if(Customers.Customers_Password.CompareTo(CusPass)==0)
                {
                    ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Đăng nhập thành công !</div>";
                    var listProduct = (from pro in db.PRODUCTs
                                       where pro.Product_Status == 1
                                       select pro).ToList();
                    Session["Customers"] = Customers;
                    return View("~/Views/Home/Index.cshtml",listProduct);
                }
               else
                {
                    ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Mật khẩu không chính xác !</div>";
                    ViewBag.CusEmail = CusEmail;
                    return View("Login");
                }
            }
        }
    }
}