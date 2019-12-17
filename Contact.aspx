<%@ Page Title="Contact" Language="C#" MasterPageFile="~/Master/Hikes.Master" AutoEventWireup="true"
    CodeBehind="Contact.aspx.cs" Inherits="FamilyHikes2019.Contact" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-6 col-xl-6 ml-lg-5 ml-xl-5">
                <div id="FormTable" class="form-group" runat="server">
                    <h4>Questions or Suggestions?</h4>
                    <p class="mb-1">
                        <asp:Label ID="Label1" runat="server">Your Name:</asp:Label>
                    </p>
                    <p>
                        <span class="d-block">
                            <asp:TextBox ID="tbx_name" CssClass="form-control" runat="server"></asp:TextBox>
                        </span>
                        <span class="d-block">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_name"
                                Display="Dynamic" ForeColor="Red">Name is required.</asp:RequiredFieldValidator>
                        </span>
                    </p>
                    <p class="mb-1">
                        <asp:Label ID="Label2" runat="server">Your E-Mail:</asp:Label>
                    </p>
                    <p>
                        <span class="d-block">
                            <asp:TextBox ID="tbx_email" runat="server" CssClass="form-control"></asp:TextBox>
                        </span>
                        <span class="d-block">
                            <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server"
                                ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_email"
                                Display="Dynamic" ForeColor="Red">E-Mail is required.</asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                 ErrorMessage="Enter a valid E-mail address"
                                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*"
                                            ForeColor="Red" Display="Dynamic" ControlToValidate="tbx_email"></asp:RegularExpressionValidator>
                        </span>
                    </p>

                    <p class="mb-1">
                        <asp:Label ID="Label3" runat="server">Your Message:</asp:Label>
                    </p>
                    <p>
                         <span class="d-block">
                        <asp:TextBox ID="tbx_message" runat="server" CssClass="form-control" Rows="7" TextMode="MultiLine"></asp:TextBox>
                    </span>
                         <span class="d-block">
                             <asp:RequiredFieldValidator ID="RequiredFieldValidator3" runat="server" 
                                 ErrorMessage="RequiredFieldValidator" ControlToValidate="tbx_message"
                                 ForeColor="Red" Display="Dynamic" >Message is required.</asp:RequiredFieldValidator>
                             </span>
                             </p>
                    <p>
                        <asp:Button ID="btn_send" CssClass="btn btn-success" runat="server" Text="Send"
                            OnClick="btn_send_Click" />
                    </p>
                </div>
                <asp:Label ID="confirm" runat="server" Text="Your message has been sent." Visible="false"></asp:Label>
            </div>
        </div>
    </div>
</asp:Content>



