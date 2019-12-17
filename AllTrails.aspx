<%@ Page Title="All Trails" Language="C#" MasterPageFile="~/Master/Hikes.Master"
    AutoEventWireup="true"
    CodeBehind="AllTrails.aspx.cs" Inherits="FamilyHikes2019.AllTrails" %>

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
                        <EmptyDataTemplate>Sorry, we couldn't find anyting. You can try another search word.
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

    <%-- showing list of all tags--%>
    <div class="container-fluid ml-auto">
        <h4>Hike Tags: </h4>
        <asp:DataList ID="DataList1" runat="server" DataSourceID="TagSqlDataSource"
            RepeatDirection="Horizontal" ItemStyle-HorizontalAlign="Left" Style="margin-bottom: 20px;"
            CellPadding="5">
            <ItemTemplate>
                <asp:HyperLink ID="TrailTag" runat="server" Text='<%# Eval("Tag") %>'
                    NavigateUrl='<%# "TrailByTag.aspx?Tag="+ Eval("Tag") %>' ForeColor="White"
                    BackColor="DarkGray"
                    Class="rounded p-1" />
            </ItemTemplate>
        </asp:DataList>
    </div>

    <%--   connection to database for showing list of tags--%>
    <asp:SqlDataSource ID="TagSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:Hikes2019ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:Hikes2019ConnectionString.ProviderName %>"
        SelectCommand="SELECT DISTINCT [Tag] FROM [TrailTagView]"></asp:SqlDataSource>


    <%--showing list of trails--%>
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-8 col-xl-8 col-md-12 col-sm-12">
                <div class="table table-hover table-striped table-responsive rounded">
                    <asp:GridView ID="GridView_allTrails" runat="server" CssClass="w-100" AllowPaging="True"
                        AllowSorting="True" AutoGenerateColumns="False" DataKeyNames="ID"
                        DataSourceID="TrailListSqlDataSource" HeaderStyle-ForeColor="#343a40"
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

                        <HeaderStyle HorizontalAlign="Center" ForeColor="#343a40"></HeaderStyle>
                    </asp:GridView>
                </div>
            </div>

            <%--link for adding hike--%>
            <div class="col-lg-4 col-xl-4 col-md-12 col-sm-12 text-center">
                <uc1:AddhikeBanner runat="server" ID="AddhikeBanner" />
            </div>

        </div>
    </div>
    <asp:SqlDataSource ID="TrailListSqlDataSource" runat="server"
        ConnectionString="<%$ ConnectionStrings:Hikes2019ConnectionString %>"
        ProviderName="<%$ ConnectionStrings:Hikes2019ConnectionString.ProviderName %>"
        
        SelectCommand="SELECT [ID], [State], [TrailName], [Location], [TrailFeatures], [Description], [Length], [Duration], [Difficulty], [Tipps], [Pictures], [Author], [AddingDay] FROM [HikesList] ORDER BY [ID] DESC">
    </asp:SqlDataSource>

</asp:Content>
