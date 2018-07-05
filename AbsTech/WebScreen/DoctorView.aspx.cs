using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AbsTech.WebScreen
{
    public partial class DoctorView : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            BindGvPatientDetails();
        }
        public void BindGvPatientDetails()
        {

            DataTable dt = new DataTable();
            dt.Columns.Add("rowid");
            dt.Columns.Add("Grade");
            dt.Columns.Add("Grade_Image_dec");

            DataRow dr_value;
            dr_value = dt.NewRow();
            dr_value["rowid"] = "1";
            dr_value["Grade"] = "304";
            dr_value["Grade_Image_dec"] = "	Stainless steel bar and flats-Specification";
            dt.Rows.Add(dr_value);
            dt.AcceptChanges();

            dr_value = dt.NewRow();
            dr_value["rowid"] = "2";
            dr_value["Grade"] = "304";
            dr_value["Grade_Image_dec"] = "Stainless steel sheets and strips for untensils-Specification";
            dt.Rows.Add(dr_value);
            dt.AcceptChanges();

            dr_value = dt.NewRow();
            dr_value["rowid"] = "3";
            dr_value["Grade"] = "304";
            dr_value["Grade_Image_dec"] = "Stainless steel plate,sheet and trip-Specification";
            dt.Rows.Add(dr_value);
            dt.AcceptChanges();
            gvPatientDetails.DataSource = dt;
            gvPatientDetails.DataBind();

        }
        protected void gvPatientDetails_PreRender(object sender, EventArgs e)
        {
            try
            {
                if (gvPatientDetails.Rows.Count > 0)
                {
                    // This replaces <td> with <th> and adds the scope attribute
                    gvPatientDetails.UseAccessibleHeader = true;

                    // This will add the <thead> and <tbody> elements
                    gvPatientDetails.HeaderRow.TableSection = TableRowSection.TableHeader;

                    // This adds the <tfoot> element.
                    // Remove if you don't have a footer row
                    gvPatientDetails.FooterRow.TableSection = TableRowSection.TableFooter;
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
        }
    }
}