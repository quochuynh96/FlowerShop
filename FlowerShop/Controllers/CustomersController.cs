using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class CustomersController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: Customers
        public ActionResult Index()
        {
            if (Session["Customers"] == null)
            {
                return View("~/Views/Login/Login.cshtml");
            }
            else
            {
                CUSTOMER cus = Session["Customers"] as CUSTOMER;
                return View("Index",cus);
            }
        }
        [HttpPost]
        public ActionResult UpdateInfo(FormCollection form)
        {
            if (Session["Customers"] == null)
            {
                return View("~/Views/Login/Login.cshtml");
            }
            else
            {
                CUSTOMER cus = Session["Customers"] as CUSTOMER;
                var cust = (from c in db.CUSTOMERS
                            where c.Customers_ID == cus.Customers_ID
                            select c).FirstOrDefault();
                cust.Customers_Name = form["Customers_Name"];
                cust.Customers_Password = form["Customers_Password"];
                cust.Customers_Phone = form["Customers_Phone"];
                cust.Customers_Address = form["Customers_Address"];
                db.SaveChanges();
                Session["Customers"] = cust;
                return View("Index", cust);
            }
        }
        [HttpPost]
        public ActionResult UpdateInfoAdmin(FormCollection form)
        {
            if (Session["Customers"] == null)
            {
                return View("~/Views/Login/Login.cshtml");
            }
            else
            {
                CUSTOMER cus = Session["Customers"] as CUSTOMER;
                var cust = (from c in db.CUSTOMERS
                            where c.Customers_ID == cus.Customers_ID
                            select c).FirstOrDefault();
                cust.Customers_Password = form["Customers_Password"];
                db.SaveChanges();
                Session["Customers"] = cust;
                return View("Index", cust);
            }
        }
    }
}