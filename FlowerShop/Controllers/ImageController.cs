using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.Hosting;
using System.Web.Mvc;

namespace FlowerShop.Controllers
{
    public class ImageController : Controller
    {
        FlowerShopEntities db = new FlowerShopEntities();
        // GET: Image
        public ActionResult Index()
        {
            var listImg = db.IMAGEs.ToList();
            return View("ListImage",listImg);
        }
        [HttpGet]
        public ActionResult IndexByProID(int Product_ID)
        {
            var listImg = (from i in db.IMAGEs
                           where i.Product_ID == Product_ID
                           select i).ToList();
            return View("ListImage", listImg);
        }
        [HttpGet]
        public ActionResult Delete(int Image_ID)
        {
            var img = (from i in db.IMAGEs
                           where i.Image_ID == Image_ID
                           select i).FirstOrDefault();
            db.IMAGEs.Remove(img);
            db.SaveChanges();
            var listImg = db.IMAGEs.ToList();
            return View("ListImage", listImg);
        }
        [HttpGet]
        public ActionResult UpLoad()
        {
            var lidtPro = db.PRODUCTs.ToList();
            return View("UpLoadImage", lidtPro);
        }
        [HttpPost]
        public ActionResult UpLoadNew(FormCollection form)
        {
            Session["UpLoadProID"] = form["Product_ID"];
            int id = int.Parse(form["Product_ID"]);
            var pro = (from p in db.PRODUCTs
                       where p.Product_ID == id
                       select p).FirstOrDefault();
            return View("UpLoadImage2", pro);
        }
        [HttpPost]
        public ActionResult UpLoadNew2(HttpPostedFileBase file)
        {
            if (file != null && file.ContentLength > 0)
                try
                {
                    string path = Path.Combine(Server.MapPath("~/Images/product"),
                                               Path.GetFileName(file.FileName));
                    file.SaveAs(path);
                    int id = int.Parse(Session["UpLoadProID"].ToString());
                    IMAGE img = new IMAGE();
                    string projectPath = HostingEnvironment.ApplicationPhysicalPath;
                    path = path.Replace(projectPath, "/");
                    img.Image_Path = path;
                    img.Product_ID = id;

                    db.IMAGEs.Add(img);
                    db.SaveChanges();
                }
                catch (Exception ex)
                {
                    ViewBag.Message = "ERROR:" + ex.Message.ToString();
                }
            else
            {
                ViewBag.Message = "You have not specified a file.";
            }
            var listImg = db.IMAGEs.ToList();
            return View("ListImage", listImg);
        }
    }
}