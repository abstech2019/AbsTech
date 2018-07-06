using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace AbsTech
{
    public partial class Login : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnSignIn_Click(object sender, EventArgs e)
        {
            if(!string.IsNullOrEmpty(txtUserName.Text)&& !string.IsNullOrEmpty(txtPassword.Text))
            {
                if(txtUserName.Text.Equals("Doctor") && txtPassword.Text.Equals("123"))
                {
                    Response.Redirect(@"~\WebScreen\DoctorView.aspx");
                }
                else if (txtUserName.Text.Equals("Patient") && txtPassword.Text.Equals("123"))
                {
                    Response.Redirect(@"~\WebScreen\ClientView.aspx");
                }
                else
                {
                    Response.Redirect("Login.aspx");
                }
            }
        }
    }
}