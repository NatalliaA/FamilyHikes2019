<%@ Control Language="C#" AutoEventWireup="true" CodeBehind="Banner.ascx.cs" Inherits="FamilyHikes2019.Controls.Banner" %>
<asp:Panel ID="Panel_banner" runat="server">
    <div class="row">
        <div class="col-2"></div>
                    
            <div class="col-2">
               <span class="blink_img1"><a href="http://www.rei.com/" target="_blank">
                    <asp:Image ID="img_rei" CssClass="img-fluid rounded" runat="server"
                        AlternateText="Image REI" ImageUrl="~/Pictures/rei.jpg" />
                </a>
                   </span>
            </div>
        
            <div class="col-2">
                <span class="blink_img2">
                <a href="http://www.savethechildren.org/" target="_blank">
                    <asp:Image ID="img_saveChildren" CssClass="img-fluid rounded" 
                        runat="server" AlternateText="Image Save Children"
                        ImageUrl="~/Pictures/saveChildren.jpg" />
                </a>
                    </span>
            </div>
            <div class="col-2">
                 <span class="blink_img3">
                <a href="https://childmind.org/" target="_blank">
                    <asp:Image ID="img_healthyKids" CssClass="img-fluid rounded" runat="server"
                        ImageUrl="~/Pictures/Childmind.JPG"
                        AlternateText="Image Child Mind Institute" />
                </a>
                     </span>
            </div>
        <div class="col-2">
             <span class="blink_img4">
            <a href="http://www.nps.gov/index.htm" target="_blank">
                <asp:Image ID="img_natPark" CssClass="img-fluid rounded" runat="server"
                    AlternateText="Image National Park Service"
                    ImageUrl="~/Pictures/NP.jpg" />
            </a>
                 </span>
            </div>
            <div class="col-2"> </div>
        </div>
</asp:Panel>

