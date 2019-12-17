<%@ Page Title="Add Your Hike" Language="C#" MasterPageFile="~/Master/Hikes.Master"
    AutoEventWireup="true"
    CodeBehind="AddHike.aspx.cs" Inherits="FamilyHikes2019.AddHike" %>

<%@ Register Src="~/Controls/AddhikeBanner.ascx" TagPrefix="uc1" TagName="AddhikeBanner" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <link href="Content/themes/base/jquery-ui.css" rel="stylesheet" />
    <script src="Scripts/jquery-3.4.1.js"></script>
    <script src="Scripts/jquery-ui-1.12.1.js"></script>
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

<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-xl-6 ml-lg-5 ml-xl-5">
                <asp:Label ID="lbl_loginFirst" runat="server" Visible="false">
                    <asp:HyperLink ID="link_login" NavigateUrl="~/Login.aspx"
                        runat="server">Log in</asp:HyperLink>
                    (<asp:HyperLink ID="link_signup"
                        NavigateUrl="~/Register.aspx" runat="server">Sign up</asp:HyperLink>) to add
                    your hike.
                </asp:Label>
                <div id="addHike_form" class="form-group" runat="server">
                    <h3>Share Your Hike</h3>

                    <p style="color: #43AC38">* All fields are required.</p>
                    <p class="mb-1">
                        <asp:Label ID="lbl_checkInput" ForeColor="Red" runat="server" Text="Check" Visible="False"></asp:Label>
                    </p>

                    <p class="mb-1">
                        <asp:Label ID="Label1" runat="server">Trail Name:</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="tbx_trailName" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                            ErrorMessage="RequiredFieldValidator"
                            ControlToValidate="tbx_trailName"
                            CssClass="failureNotification" Display="Dynamic" ForeColor="red">Trail Name is required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label2" runat="server">Select State:</asp:Label>
                    </p>
                    <p>
                        <asp:DropDownList ID="ddl_state"
                            CssClass="form-control col-lg-3 col-xl-3 col-md-6"
                            runat="server">
                            <asp:ListItem Selected="True">Select</asp:ListItem>
                            <asp:ListItem>Alabama</asp:ListItem>
                            <asp:ListItem>Alaska</asp:ListItem>
                            <asp:ListItem>Arizona</asp:ListItem>
                            <asp:ListItem>Arkansas</asp:ListItem>
                            <asp:ListItem>California</asp:ListItem>
                            <asp:ListItem>Colorado</asp:ListItem>
                            <asp:ListItem>Connecticut </asp:ListItem>
                            <asp:ListItem>Delaware </asp:ListItem>
                            <asp:ListItem>Florida </asp:ListItem>
                            <asp:ListItem>Georgia </asp:ListItem>
                            <asp:ListItem>Hawaii </asp:ListItem>
                            <asp:ListItem>Idaho </asp:ListItem>
                            <asp:ListItem>Illinois</asp:ListItem>
                            <asp:ListItem>Indiana </asp:ListItem>
                            <asp:ListItem>Iowa </asp:ListItem>
                            <asp:ListItem>Kansas </asp:ListItem>
                            <asp:ListItem>Kentucky </asp:ListItem>
                            <asp:ListItem>Louisiana </asp:ListItem>
                            <asp:ListItem>Maine </asp:ListItem>
                            <asp:ListItem>Maryland </asp:ListItem>
                            <asp:ListItem>Massachusetts </asp:ListItem>
                            <asp:ListItem>Michigan </asp:ListItem>
                            <asp:ListItem>Minnesota </asp:ListItem>
                            <asp:ListItem>Mississippi </asp:ListItem>
                            <asp:ListItem>Missouri </asp:ListItem>
                            <asp:ListItem>Montana</asp:ListItem>
                            <asp:ListItem>Nebraska </asp:ListItem>
                            <asp:ListItem>Nevada </asp:ListItem>
                            <asp:ListItem>New Hampshire </asp:ListItem>
                            <asp:ListItem>New Jersey </asp:ListItem>
                            <asp:ListItem>New Mexico </asp:ListItem>
                            <asp:ListItem>New York </asp:ListItem>
                            <asp:ListItem>North Carolina </asp:ListItem>
                            <asp:ListItem>North Dakota </asp:ListItem>
                            <asp:ListItem>Ohio </asp:ListItem>
                            <asp:ListItem>Oklahoma </asp:ListItem>
                            <asp:ListItem>Oregon </asp:ListItem>
                            <asp:ListItem>Pennsylvania</asp:ListItem>
                            <asp:ListItem>Rhode Island </asp:ListItem>
                            <asp:ListItem>South Carolina </asp:ListItem>
                            <asp:ListItem>South Dakota </asp:ListItem>
                            <asp:ListItem>Tennessee </asp:ListItem>
                            <asp:ListItem>Texas </asp:ListItem>
                            <asp:ListItem>Utah </asp:ListItem>
                            <asp:ListItem>Vermont </asp:ListItem>
                            <asp:ListItem>Virginia </asp:ListItem>
                            <asp:ListItem>Washington </asp:ListItem>
                            <asp:ListItem>West Virginia </asp:ListItem>
                            <asp:ListItem>Wisconsin </asp:ListItem>
                            <asp:ListItem>Wyoming</asp:ListItem>
                        </asp:DropDownList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                            ErrorMessage="RequiredFieldValidator" InitialValue="Select"
                            ControlToValidate="ddl_state"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">State is required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label3" runat="server">Trail Location (e.g. Rocky Mountain National Park Colorado,USA):</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="tbx_location" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator3"
                            runat="server" ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_location"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Trail Location is required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label4" runat="server">Trail Top Features (e.g. lake view):</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="tbx_trailFeatures" CssClass="form-control" runat="server" Rows="3"
                            TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator4" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_trailFeatures"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Trail Top Features are required.</asp:RequiredFieldValidator>
                    </p>
                   
                    <p class="mb-1">
                        <asp:Label ID="Label5" runat="server">Trail Length (e.g. 3mi):</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="tbx_length" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator5" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_length"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Trail Length is required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label6" runat="server">Hike Duration (e.g. 2.5h):</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="tbx_time" CssClass="form-control" runat="server"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator6" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_time"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Hike Duration is required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label7" runat="server">Hike Difficulty (select one):</asp:Label>
                    </p>
                    <p>
                        <asp:RadioButtonList ID="rbt_difficulty" runat="server"
                            RepeatDirection="Horizontal" AutoPostBack="False" ViewStateMode="Enabled"
                            CellSpacing="5"
                            CellPadding="5" TextAlign="Right">
                            <asp:ListItem>Easy</asp:ListItem>
                            <asp:ListItem>Moderate</asp:ListItem>
                            <asp:ListItem>Difficult</asp:ListItem>
                        </asp:RadioButtonList>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator7" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="rbt_difficulty"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Hike Difficulty is required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label8" runat="server">Hike Description:</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="tbx_description" CssClass="form-control" runat="server"
                            Rows="10" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator8" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_description"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Hike Description is required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label9" runat="server">Tipps (e.g. camping):</asp:Label>
                    </p>
                    <p>
                        <asp:TextBox ID="tbx_tipps" CssClass="form-control" runat="server"
                            Rows="3" TextMode="MultiLine"></asp:TextBox>
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator9" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_tipps"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Tipps are required.</asp:RequiredFieldValidator>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label10" runat="server">Picture:</asp:Label>
                    </p>
                    <p>
                        <asp:FileUpload ID="fup_picture" CssClass="form-control-file rounded" runat="server" />
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator10" runat="server"
                            ErrorMessage="RequiredFieldValidator" ControlToValidate="fup_picture"
                            CssClass="failureNotification" Display="Dynamic"
                            ForeColor="red">Picture is required.</asp:RequiredFieldValidator>
                    </p>
                     
                    <%--jquery ui datepicker--%>
                    <%-- <p class="mb-1">Date (calendar appears on mouse click):</p>
                    <div class="input-group">
                        <input type="text" class="form-control col-lg-4 col-xl-4 cl-md-6"
                            id="datepicker" />
                    </div>--%>

                    <%--for date calendar--%>
                    <%-- using calendar icon form fontawesome.css --%>
                    <%-- <script type="text/javascript">

                        $("#datepicker").datepicker(
                            {
                                showOn: "both",
                                buttonText: "<i class='fa fa-calendar'></i>"
                            }
                        );
                    </script>
                    <script>
                        $("#datepicker").datepicker().datepicker("setDate", new Date());
                    </script>--%>

                    <%-- Allow users to tag this trail--%>

                    <p>
                        <asp:Button ID="btn_addHike" runat="server" Text="Submit Your Hike"
                            CssClass="btn btn-success mt-3" OnClick="btn_addHike_Click"></asp:Button>
                    </p>

                </div>               
        </div>
    </div>
    </div>
</asp:Content>
