using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class ProductController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: Product
        public ActionResult Index()
        {
            var listProduct = db.PRODUCTs.ToList();
            return View("Product", listProduct);
        }
        [HttpGet]
        public ActionResult Create()
        {
            var listCategory = db.CATEGORIES.ToList();
            ViewData["listCategory"] = listCategory;
            return View("CreateProduct");
        }
        [HttpGet]
        public ActionResult Edit(string ID)
        {
            int proID = int.Parse(ID);
            var product = (from pro in db.PRODUCTs
                           where pro.Product_ID == proID
                           select pro).FirstOrDefault();
            var listCategory = db.CATEGORIES.ToList();
            ViewData["listCategory"] = listCategory;
            return View("EditProduct", product);
        }
        [HttpGet]
        public ActionResult Delete(string ID)
        {
            int proID = int.Parse(ID);
            var product = (from pro in db.PRODUCTs
                           where pro.Product_ID == proID
                           select pro).FirstOrDefault();
            return View("DeleteProduct", product);
        }
        [HttpGet]
        public ActionResult Hide(string ID)
        {
            int proID = int.Parse(ID);
            var product = (from pro in db.PRODUCTs
                           where pro.Product_ID == proID
                           select pro).FirstOrDefault();
            product.Product_Status = 0;
            if (db.SaveChanges() != 0)
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Ẩn sản phẩm "+product.Product_Name+" thành công !</div>";
                return View("Product", listProduct);
            }
            else
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Đã xảy ra lỗi !</div>";
                return View("Product", listProduct);
            }
        }
        [HttpGet]
        public ActionResult Show(string ID)
        {
            int proID = int.Parse(ID);
            var product = (from pro in db.PRODUCTs
                           where pro.Product_ID == proID
                           select pro).FirstOrDefault();
            product.Product_Status = 1;
            if (db.SaveChanges() != 0)
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Hiện sản phẩm " + product.Product_Name + " thành công !</div>";
                return View("Product", listProduct);
            }
            else
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Đã xảy ra lỗi !</div>";
                return View("Product", listProduct);
            }
        }
        [HttpPost]
        public ActionResult ConfirmDelete(FormCollection form)
        {
            int proID = int.Parse(form["Product_ID"]);
            var product = (from pro in db.PRODUCTs
                           where pro.Product_ID == proID
                           select pro).FirstOrDefault();
            db.PRODUCTs.Remove(product);
            if (db.SaveChanges() != 0)
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Xóa sản phẩm thành công !</div>";
                return View("Product", listProduct);
            }
            else
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Đã xảy ra lỗi !</div>";
                return View("Product", listProduct);
            }
        }
        [HttpPost]
        public ActionResult EditInfoProduct(FormCollection form)
        {
            string ID = form["Product_ID"];
            int proID = int.Parse(ID);
            var newPro = (from pro in db.PRODUCTs
                           where pro.Product_ID == proID
                           select pro).FirstOrDefault();
            newPro.Product_Name = form["Product_Name"];
            newPro.Product_Price = int.Parse(form["Product_Price"]);
            newPro.Product_Description = form["Product_Description"];
            newPro.Product_Stock_Quantity = long.Parse(form["Product_Stock_Quantity"]);
            newPro.Product_Status = 1;
            newPro.Categories_ID = int.Parse(form["Categories_ID"]);
            if (db.SaveChanges() != 0)
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Thay đổi thông tin thành công !</div>";
                return View("Product", listProduct);
            }
            else
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Đã xảy ra lỗi !</div>";
                return View("Product", listProduct);
            }
        }
        [HttpPost]
        public ActionResult AddNewProduct(FormCollection form)
        {
            PRODUCT newPro = new PRODUCT();
            newPro.Product_Name = form["Product_Name"];
            newPro.Product_Price = int.Parse(form["Product_Price"]);
            newPro.Product_Description = form["Product_Description"];
            newPro.Product_Stock_Quantity = long.Parse(form["Product_Stock_Quantity"]);
            newPro.Product_Status = 1;
            newPro.Categories_ID = int.Parse(form["Categories_ID"]);
            db.PRODUCTs.Add(newPro);
            if (db.SaveChanges() != 0)
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-success\" role=\"alert\"><i class=\"fas fa-check\"></i>&nbsp;Thêm sản phẩm thành công !</div>";
                return View("Product", listProduct);
            }
            else
            {
                var listProduct = db.PRODUCTs.ToList();
                ViewBag.Message = "<div class=\"alert alert-danger\" role=\"alert\"><i class=\"fas fa-times\"></i>&nbsp;Đã xảy ra lỗi !</div>";
                return View("Product", listProduct);
            }

        }
    }
}