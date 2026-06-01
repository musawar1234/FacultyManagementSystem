using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication_EntryForm
{
    public partial class ImageUploadeForm : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }
        //protected byte[] ResizedImageBytes
        //{
        //    get { return (byte[])Session["ResizedImageBytes"]; }
        //    set { Session["ResizedImageBytes"] = value; }
        //}
        protected void btnUpload_Click(object sender, EventArgs e)
        {
            if (FileUpload1.HasFile)
            {
                using (var uploadedStream = FileUpload1.PostedFile.InputStream)
                using (var originalImage = System.Drawing.Image.FromStream(uploadedStream))
                {
                    int canvasWidth = 250;
                    int canvasHeight = 250;

                    // Calculate aspect ratio preserving size
                    double ratioX = (double)canvasWidth / originalImage.Width;
                    double ratioY = (double)canvasHeight / originalImage.Height;
                    double ratio = Math.Min(ratioX, ratioY);

                    int newWidth = (int)(originalImage.Width * ratio);
                    int newHeight = (int)(originalImage.Height * ratio);

                    int posX = (canvasWidth - newWidth) / 2;
                    int posY = (canvasHeight - newHeight) / 2;

                    using (var bitmap = new System.Drawing.Bitmap(canvasWidth, canvasHeight))
                    {
                        using (var graphics = System.Drawing.Graphics.FromImage(bitmap))
                        {
                            // Fill entire bitmap with blue background
                            graphics.Clear(System.Drawing.Color.Blue);

                            // Set high quality options
                            graphics.InterpolationMode = System.Drawing.Drawing2D.InterpolationMode.HighQualityBicubic;
                            graphics.SmoothingMode = System.Drawing.Drawing2D.SmoothingMode.HighQuality;
                            graphics.PixelOffsetMode = System.Drawing.Drawing2D.PixelOffsetMode.HighQuality;
                            graphics.CompositingQuality = System.Drawing.Drawing2D.CompositingQuality.HighQuality;

                            // Draw the resized original image on top, centered
                            graphics.DrawImage(originalImage, posX, posY, newWidth, newHeight);
                        }

                        using (var memoryStream = new System.IO.MemoryStream())
                        {
                            bitmap.Save(memoryStream, System.Drawing.Imaging.ImageFormat.Png);
                            byte[] imageBytes = memoryStream.ToArray();
                            string base64String = Convert.ToBase64String(imageBytes);
                            Image1.ImageUrl = "data:image/png;base64," + base64String;
                        }
                    }
                }
            }
        }

        //protected void Button1_Click(object sender, EventArgs e)
        //{
        //    if (ResizedImageBytes != null)
        //    {
        //        Response.Clear();
        //        Response.ContentType = "image/jpeg";
        //        Response.AddHeader("Content-Disposition", "attachment;filename=ResizedImage.jpg");
        //        Response.BinaryWrite(ResizedImageBytes);
        //        Response.Flush();
        //        Response.End(); // Or HttpContext.Current.ApplicationInstance.CompleteRequest();
        //    }
        //}

    }
}