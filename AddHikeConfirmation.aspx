<%@ Page Title="Last Step: Tags" Language="C#" MasterPageFile="~/Master/Hikes.Master" AutoEventWireup="true"
    CodeBehind="AddHikeConfirmation.aspx.cs" Inherits="FamilyHikes2019.AddHikeConfirmation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-xl-6 ml-lg-5 ml-xl-5">
                <div id="tags_form" class="form-group" runat="server">
                    <h3 class="mb-2">Last Step: Tag Your Hike</h3>
                    <%-- getting id and trail name of the last added hike --%>
                    <asp:DataList ID="DataListTrail" runat="server"
                        DataSourceID="LastHikeSqlDataSource1" DataKeyField="ID">
                        <ItemTemplate>
                            <asp:Label ID="hike_ID" runat="server" Text='<%# Eval("ID") %>' />
                            <asp:Label ID="lb_TrailName" runat="server" Text='<%# Eval("TrailName") %>' />
                        </ItemTemplate>
                    </asp:DataList>
                    <asp:SqlDataSource ID="LastHikeSqlDataSource1" runat="server"
                        ConnectionString="<%$ ConnectionStrings:Hikes2019ConnectionString %>"
                        ProviderName="<%$ ConnectionStrings:Hikes2019ConnectionString.ProviderName %>"
                        SelectCommand="SELECT TOP 1 [ID], [TrailName] FROM [HikesList] ORDER BY [ID] DESC">
                    </asp:SqlDataSource>

                    <p class="mb-1">
                        <asp:Label ID="lbl_tags" runat="server">Help others find your hike by adding matching tag(s):</asp:Label>
                    </p>
                    <p>

                        <%-- Allow users to tag this trail--%>

                        <asp:CheckBoxList ID="chbxl_tags" runat="server"
                            DataSourceID="AllTagsSqlDataSource1" DataTextField="Tag" RepeatDirection="Horizontal"
                            DataValueField="ID">
                        </asp:CheckBoxList>
                        <asp:SqlDataSource ID="AllTagsSqlDataSource1" runat="server"
                            ConnectionString="<%$ ConnectionStrings:Hikes2019ConnectionString %>"
                            ProviderName="<%$ ConnectionStrings:Hikes2019ConnectionString.ProviderName %>"
                            SelectCommand="SELECT [ID], [Tag] FROM [Tags] WHERE ([Tag] &lt;&gt; ?)">
                            <SelectParameters>
                                <asp:Parameter DefaultValue=" " Name="Tag" Type="String" />
                            </SelectParameters>
                        </asp:SqlDataSource>
                        <asp:Button ID="btn_tagHike" CssClass="btn btn-success" runat="server"
                            Text="Tag" OnClick="btn_tagHike_Click" />                     
            
                 <asp:CustomValidator ID="CustomValidator1"                           
                            ErrorMessage="Select at least one tag." 
                     ClientValidationFunction="ValidateColorList" runat="server"
                            CssClass="failureNotification"
                            ForeColor="Red" Display="Dynamic"></asp:CustomValidator>                 
               
            </div>

                <script type="text/javascript">
       function ValidateColorList(source, args) {
           var chkListModules = document.getElementById('<%= chbxl_tags.ClientID %>');
           var chkListinputs = chkListModules.getElementsByTagName("input");
           for (var i = 0; i < chkListinputs.length; i++) {
               if (chkListinputs[i].checked) {
                   args.IsValid = true;
                   return;
               }
           }
           args.IsValid = false;
       }
 
   </script>            

        </div>
    </div>
    </div>
    

</asp:Content>
