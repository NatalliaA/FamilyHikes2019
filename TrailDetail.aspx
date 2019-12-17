<%@ Page Title="Trail Detail" Language="C#" MasterPageFile="~/Master/Hikes.Master"
    AutoEventWireup="true"
    CodeBehind="TrailDetail.aspx.cs" Inherits="FamilyHikes2019.TrailDetail" %>

<%@ Register Src="~/Controls/AddhikeBanner.ascx" TagPrefix="uc1" TagName="AddhikeBanner" %>


<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>

<%--Search Content3appears only after submiting search button--%>
<%--showing search results--%>

<asp:Content ID="ContentSearch" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-xl-8 col-md-12 col-sm-12">

                <%-- Add a hidden box to store search value so that we can clear search textbox --%>
                <asp:TextBox ID="tbx_hiddenSearch" runat="server" Visible="False"></asp:TextBox>
                <h4 id="search_frase">Search Results for:
                    <asp:Label ID="lb_filter" runat="server" Text="Filter" ForeColor="#43AC38"></asp:Label>
                </h4>
                <div class="table table-hover table-striped table-responsive rounded">
                    <asp:GridView ID="GridView_SearchResult" runat="server" AllowPaging="True"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID"
                        DataSourceID="SearchSqlDataSource" CssClass="w-100" HeaderStyle-ForeColor="#343a40"
                        GridLines="None" HeaderStyle-HorizontalAlign="Center" PageSize="5">
                        <Columns>
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State"
                                ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="TrailName" HeaderText="Trail Name"
                                SortExpression="TrailName" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Difficulty" HeaderText="Difficulty"
                                SortExpression="Difficulty" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:BoundField DataField="Length" HeaderText="Length"
                                SortExpression="Length" ItemStyle-HorizontalAlign="Center">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:BoundField>
                            <asp:ImageField DataImageUrlField="Pictures" HeaderText="Picture" ControlStyle-CssClass="img-fluid rounded"
                                ItemStyle-Width="100px" ItemStyle-HorizontalAlign="Center">
                                <ControlStyle CssClass="img-fluid rounded"></ControlStyle>

                                <ItemStyle HorizontalAlign="Center" Width="100px"></ItemStyle>
                            </asp:ImageField>
                            <asp:HyperLinkField HeaderText="Sounds Good?" Text="Explore"
                                ItemStyle-HorizontalAlign="Center" DataNavigateUrlFields="ID"
                                DataNavigateUrlFormatString="TrailDetail.aspx?ID={0}">
                                <ItemStyle HorizontalAlign="Center"></ItemStyle>
                            </asp:HyperLinkField>
                        </Columns>
                        <EmptyDataTemplate>
                            Sorry, we couldn't find anyting. You can try another search word.
                        </EmptyDataTemplate>
                        <HeaderStyle HorizontalAlign="Center" ForeColor="#343a40"></HeaderStyle>
                    </asp:GridView>
                </div>
            </div>
            <%--link for adding hike--%>
            <div class="col-lg-4 col-xl-4 col-md-12 col-sm-12 text-center">
                <uc1:AddhikeBanner runat="server" ID="AddhikeBanner1" />
            </div>
        </div>
    </div>
    <asp:SqlDataSource ID="SearchSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:Hikes2019ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:Hikes2019ConnectionString.ProviderName %>"
        SelectCommand="SELECT DISTINCT [ID], [State], [TrailName], [Location], [TrailFeatures], [Description], [Length], [Duration], [Difficulty], [Tipps], [Pictures], [Author], [AddingDay] FROM [HikesList] WHERE (([Author] LIKE '%' + ? + '%') OR ([Difficulty] LIKE '%' + ? + '%') OR ([Description] LIKE '%' + ? + '%') OR ([Duration] LIKE '%' + ? + '%') OR ([Length] LIKE '%' + ? + '%') OR ([Location] LIKE '%' + ? + '%') OR ([State] LIKE '%' + ? + '%') OR ([Tipps] LIKE '%' + ? + '%') OR ([TrailFeatures] LIKE '%' + ? + '%') OR ([TrailName] LIKE '%' + ? + '%'))">
        <SelectParameters>
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Author" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Difficulty"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Description"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Duration"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Length" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Location"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="State" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Tipps" PropertyName="Text"
                Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="TrailFeatures"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="TrailName"
                PropertyName="Text" Type="String" />
            <asp:ControlParameter ControlID="tbx_hiddenSearch" Name="Pictures"
                PropertyName="Text" Type="String" />
        </SelectParameters>
    </asp:SqlDataSource>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <%-- showing list of hike tags--%>
    <div class="container-fluid ml-auto">

         <%-- if the user came from AddHikeConfirmation after submitting a hike --%>
               <h3 class="mb-2"><asp:Label ID="lbl_before" Visible="false" runat="server" Text="Your Hike"></asp:Label></h3>

        <h4>Tags: </h4>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="HikeTagsSqlDataSource"
            RepeatDirection="Horizontal"
            ItemStyle-HorizontalAlign="Left" Style="margin-bottom: 20px;"
            CellPadding="5">
            <ItemTemplate>
                <asp:HyperLink ID="TrailTag" runat="server" Text='<%# Eval("Tag") %>'
                    NavigateUrl='<%# "TrailByTag.aspx?Tag="+ Eval("Tag") %>' ForeColor="White"
                    BackColor="DarkGray"
                    Class="rounded p-1" />
            </ItemTemplate>
        </asp:DataList>
    </div>
    <asp:SqlDataSource ID="HikeTagsSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:Hikes2019ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:Hikes2019ConnectionString.ProviderName %>"
        SelectCommand="SELECT DISTINCT [Tag] FROM [TrailTagView] WHERE ([ID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <%-- Allow users to tag this trail--%>
    <%--<div class="container-fluid ml-auto">
        <h4>Tagging: </h4>              
        
        <asp:CheckBoxList ID="chbxl_tags" runat="server" 
            DataSourceID="AllTagsSqlDataSource1" DataTextField="Tag" RepeatDirection="Horizontal" DataValueField="ID"></asp:CheckBoxList>
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
        <asp:Label ID="lbl_tagAlreadyExists" runat="server" Text="Label" Font-Size="16px"
            ForeColor="Red" />
    </div>--%>


    <%--displaying trail details--%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8">
                <div class="table table-hover table-striped table-responsive rounded">

                    <asp:DetailsView ID="TrailDetailsView" runat="server" AutoGenerateRows="False" DataKeyNames="ID"
                        DataSourceID="TrailDetailSqlDataSource" FieldHeaderStyle-ForeColor="#343a40"
                        FieldHeaderStyle-Font-Bold="true" GridLines="None"
                        FieldHeaderStyle-Width="25%">
                        <FieldHeaderStyle Font-Bold="True" ForeColor="#343A40" Width="25%"></FieldHeaderStyle>
                        <Fields>
                            <asp:BoundField DataField="TrailName" HeaderText="Trail Name"
                                SortExpression="TrailName" ItemStyle-Font-Bold="true"
                                ItemStyle-ForeColor="#43AC38" ItemStyle-Font-Size="20px"></asp:BoundField>
                            <asp:BoundField DataField="State" HeaderText="State" SortExpression="State" />
                            <asp:ImageField DataImageUrlField="Pictures" HeaderText="Picture" ControlStyle-CssClass="img-fluid rounded w-50">
                                <ControlStyle CssClass="img-fluid rounded w-50"></ControlStyle>
                            </asp:ImageField>
                            <asp:BoundField DataField="Location" HeaderText="Google Map"
                                SortExpression="Location" />
                            <asp:BoundField DataField="TrailFeatures" HeaderText="Features"
                                SortExpression="TrailFeatures" />
                            <asp:BoundField DataField="Length" HeaderText="Length"
                                SortExpression="Length" />
                            <asp:BoundField DataField="Duration" HeaderText="Duration"
                                SortExpression="Duration" />
                            <asp:BoundField DataField="Difficulty" HeaderText="Difficulty"
                                SortExpression="Difficulty" />
                            <asp:BoundField DataField="Description" HeaderText="Experience"
                                SortExpression="Description" />
                            <asp:BoundField DataField="Tipps" HeaderText="Tipps" SortExpression="Tipps" />
                            <asp:TemplateField HeaderText="Added on" SortExpression="AddingDay">
                                <ItemTemplate>
                                    <asp:Label ID="Label1" runat="server" Text='<%# Bind("AddingDay", "{0:dd/MM/yyyy}") %>'></asp:Label>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Fields>
                    </asp:DetailsView>
                </div>
            </div>

            <%--link for adding hike--%>
            <div class="col-lg-4 col-xl-4 col-md-12 col-sm-12 text-center">
                <uc1:AddhikeBanner runat="server" ID="AddhikeBanner" />
            </div>
        </div>
    </div>
    <%--   connection to database for hikes--%>
    <asp:SqlDataSource ID="TrailDetailSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:Hikes2019ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:Hikes2019ConnectionString.ProviderName %>"
        SelectCommand="SELECT [ID], [State], [Location], [TrailName], [TrailFeatures], [Description], [Length], [Duration], [Difficulty], [Tipps], [Pictures], [Author], [AddingDay] FROM [HikesList] WHERE ([ID] = ?)">
        <SelectParameters>
            <asp:QueryStringParameter Name="ID" QueryStringField="ID" Type="Int32" />
        </SelectParameters>
    </asp:SqlDataSource>

    <%-- Showing comments --%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-xl-4 col-md-6">
                <div class="ml-lg-5 ml-xl-5">
                    <h5>Comments:</h5>
                    <div class="table table-hover table-striped table-responsive rounded text-center h-100">

                        <asp:GridView ID="GridView_comments" runat="server" AutoGenerateColumns="False"
                            DataKeyNames="ID" GridLines="None" CssClass="w-100" AllowPaging="true"
                            PageSize="4" OnPageIndexChanging="GridView_comments_PageIndexChanging">
                            <Columns>
                                <asp:BoundField DataField="HikerName" HeaderText="Hiker"
                                    SortExpression="HikerName" />
                                <asp:BoundField DataField="Comment" HeaderText="Comment"
                                    SortExpression="Comment" />

                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%-- adding a comment --%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-3 col-xl-3 col-md-6">
                <div class="ml-lg-5 ml-xl-5">
                    <div class="form-group">
                        <h5 class="mt-2">Leave Your Comment (<asp:HyperLink ID="hyp_login" runat="server" NavigateUrl="~/Login.aspx">Log in</asp:HyperLink>)</h5>
                        <div id="comment_box" runat="server">
                        <p>
                            Name:
                            <asp:TextBox ID="tbx_hiker" CssClass="form-control" runat="server"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" 
                                runat="server" ControlToValidate="tbx_hiker" Display="Dynamic" 
                                ForeColor="Red" ErrorMessage="Name is reqiered"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            Comment:
                            <asp:TextBox ID="tbx_comment" CssClass="form-control" runat="server" TextMode="MultiLine"
                                Rows="5"></asp:TextBox>
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_comment" Display="Dynamic" 
                                ForeColor="Red"></asp:RequiredFieldValidator>
                        </p>
                        <p>
                            <asp:Button ID="btn_addComment" CssClass="btn btn-success" runat="server"
                                Text="Add Your Comment" OnClick="btn_addComment_Click" />
                        </p>
                            </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

</asp:Content>
