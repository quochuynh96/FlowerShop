using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Globalization;

namespace FlowerShop.Helper
{
    public class Helper
    {
        FlowerShopEntities db = new FlowerShopEntities();
        public string getImageByProductID(int ID)
        {
            var imgResult = (from img in db.IMAGEs
                       where img.Product_ID == ID
                       select img).FirstOrDefault();
            if(imgResult != null)
            {
                return imgResult.Image_Path;
            }
            else
            {
                return @"Images\logo\13.png";
            }
        }

        public List<string> getListImageByProductID(int ID)
        {
            List<string> listImage = new List<string>();
            var listImg = (from img in db.IMAGEs
                           where img.Product_ID == ID
                           select img).ToList();
            foreach(var item in listImg)
            {
                listImage.Add(item.Image_Path);
            }
            return listImage;
        }

        public CUSTOMER getCusByID(int CusID)
        {
            CUSTOMER cus = (from c in db.CUSTOMERS
                            where c.Customers_ID == CusID
                            select c).FirstOrDefault();
            return cus;
        }

        public PRODUCT getProdByID(int ProID)
        {
            PRODUCT pro = (from p in db.PRODUCTs
                           where p.Product_ID == ProID
                           select p).FirstOrDefault();
            return pro;
        }
        public List<ORDERS_DETAIL> getListOrDetailByID(int orID)
        {
            List<ORDERS_DETAIL> listOrderDetail = (from d in db.ORDERS_DETAIL
                                                   where d.Orders_ID == orID
                                                   select d).ToList();
            return listOrderDetail;
        }
        public List<CATEGORy> GetCATEGORies()
        {
            List<CATEGORy> cATEGORies = db.CATEGORIES.ToList();
            return cATEGORies;
        }

        public string getTotalCurOrderByID(int OrderID)
        {
            int sum = 0;
            var listDetail = (from or in db.ORDERS_DETAIL
                              where or.Orders_ID == OrderID
                              select or).ToList();
            if(listDetail != null)
            {
                foreach(var item in listDetail)
                {
                    sum += (int) item.Product_Num * (int) getProdByID((int)item.Product_ID).Product_Price;
                }
            }
            return sum.ToString("C0", CultureInfo.CurrentCulture);
        }
    }
}