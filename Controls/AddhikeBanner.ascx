<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="AddhikeBanner.ascx.cs" Inherits="FamilyHikes2019.Controls.AddhikeBanner" %>

            
                <h4 style="color: #343a40;" class="justify-content-center">Hiked Recently?
                </h4>
                <asp:Image ID="Image1" CssClass="img-fluid rounded mt-1" runat="server" ImageUrl="~/Pictures/Arches.jpg" />
                <p class="mt-2">
                    <asp:Button CssClass="btn btn-success mt-1 " ID="btn_search" runat="server" 
                        Text="Add Your Hike" OnClick="btn_search_Click" />
                    </p>

                   <p><asp:Label ID="lbl_LoginSignup" runat="server"><asp:HyperLink ID="link_Login" NavigateUrl="~/Login.aspx" 
                       runat="server">Log in</asp:HyperLink> (<asp:HyperLink ID="link_Signin" 
                           NavigateUrl="~/Register.aspx" runat="server">Sign up</asp:HyperLink>) to add your hike
                        </asp:Label>
                       </p>
             
           