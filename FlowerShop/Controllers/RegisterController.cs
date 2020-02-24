using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class RegisterController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: Register
        public ActionResult Index()
        {
            return View("Register");
        }
        [HttpPost]
        public ActionResult Register(FormCollection form)
        {
            string newCusEmail = form["Customers_Email"];
            var Customers = (from cus in db.CUSTOMERS
                             where cus.Customers_Email.ToLower().CompareTo(newCusEmail.ToLower()) == 0
                             select cus).FirstOrDefault();
            if(Customers != null )
            {
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Email đã được đăng ký !</div>";
                return View("Register");
            }

            CUSTOMER newCus = new CUSTOMER();
            newCus.Customers_Name = form["Customers_Name"];
            newCus.Customers_Email = form["Customers_Email"];
            newCus.Customers_Password = form["Customers_Password"];
            newCus.Customers_Phone = form["Customers_Phone"];
            newCus.Customers_Address = form["Customers_Address"];
            db.CUSTOMERS.Add(newCus);
            if(db.SaveChanges() != 0)
            {
                ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Đăng ký thành công !</div>";
                return View("~/Views/Login/Login.cshtml");
            }
            else
            {
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Đã xảy ra lỗi !</div>";
                return View("Register");
            }
        }
    }
}