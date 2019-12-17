<%@ Page Title="Log in" Language="C#" MasterPageFile="~/Master/Hikes.Master" AutoEventWireup="true"
    CodeBehind="Login.aspx.cs" Inherits="FamilyHikes2019.Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-xl-4 col-md-6 ml-lg-5 ml-xl-5">
               
                <asp:Login ID="Login1" runat="server"
                    CreateUserText="Sign Up for a new account in FamilyHikes"
                    CreateUserUrl="~/Register.aspx" CssClass="col-lg-12 col-xl-12"
                    DestinationPageUrl="~/AllTrails.aspx"
                    OnLoggingIn="Login1_LoggingIn">
                    <LayoutTemplate>                         
                        <div class="form-group" runat="server">
                            <h3>Log in</h3>
                            <p style="color: red">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </p>
                            <p class="mb-1">
                                <asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name or E-mail:</asp:Label>
                            </p>
                            <p>
                                <span class="d-block">
                                    <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>
                                </span>

                                <span class="d-block">
                                    <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
                                        ControlToValidate="UserName" Display="Dynamic" ErrorMessage="User Name or E-mail is required."
                                        ToolTip="User Name or E-mail is required." Style="color: red"
                                        ValidationGroup="ctl03$Login1">User Name or E-mail is required.</asp:RequiredFieldValidator>
                                </span>
                            </p>
                            <p class="mb-1">
                                <asp:Label ID="PasswordLabel" runat="server" AssociatedControlID="Password">Password:</asp:Label>
                            </p>
                            <p>
                                <span class="d-block">
                                    <asp:TextBox ID="Password" runat="server" CssClass="form-control"
                                        TextMode="Password"></asp:TextBox>
                                </span>
                                 <span class="d-block"><asp:RequiredFieldValidator ID="PasswordRequired" runat="server"
                                    ControlToValidate="Password" ErrorMessage="Password is required."
                                    ToolTip="Password is required." Display="Dynamic" ValidationGroup="ctl03$Login1"
                                    Style="color: red">Password is required.</asp:RequiredFieldValidator>
                            </span></p>
                            <p>
                                <asp:CheckBox ID="RememberMe" runat="server" Text="  Remember me next time." />
                            </p>

                            <p>
                                <asp:Button ID="LoginButton" runat="server" CssClass="btn btn-success mb-2" CommandName="Login"
                                    Text="Log in"
                                    ValidationGroup="ctl03$Login1" />
                            </p>
                            <p>
                                Not a member yet?
                                <asp:HyperLink ID="CreateUserLink" runat="server"
                                    NavigateUrl="~/Register.aspx">Sign up</asp:HyperLink>
                            </p>
                        </div>
                    </LayoutTemplate>
                </asp:Login>
                </div>
            </div>
        </div>



    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-xl-4 col-md-6 ml-lg-5 ml-xl-5">
                
                <%-- Password recovery --%>
                <div class="mb-3">
                    <asp:LinkButton ID="link_lostPassword" runat="server"
                        OnClick="link_lostPassword_Click">Password Help</asp:LinkButton>
                </div>
                 </div>
            </div>
        </div>

    <div class="container-fluid">
        <div class="row">
            <div class="col-lg-4 col-xl-4 col-md-6 ml-lg-5 ml-xl-5">

                <asp:PasswordRecovery ID="PasswordRecovery1" Visible="false"
                    OnVerifyingUser="PasswordRecovery1_VerifyingUser"
                    runat="server">
                    <%-- will send an email with e new ato-generated password --%>
                    <MailDefinition Subject="Your New Password for FamilyHikes.com">
                    </MailDefinition>
                    <UserNameTemplate>
                        <div class="form-group" runat="server">
                            <h3>Password Help</h3>
                           
                            <p>Enter your User Name or E-mail to receive your password:</p>
                            <%-- displaying error message to unable to log in --%>
                            <p style="color: red">
                                <asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal>
                            </p>
                            <p>
                                <%--<asp:Label ID="UserNameLabel" runat="server" AssociatedControlID="UserName">User Name:</asp:Label>--%>
                                <asp:TextBox ID="UserName" CssClass="form-control" runat="server"></asp:TextBox>

                                <asp:RequiredFieldValidator ID="UserNameRequired" runat="server"
                                    ControlToValidate="UserName" ErrorMessage="User Name or E-mail is required."
                                    ToolTip="User Name or E-mail is required." Style="color: red"
                                    ValidationGroup="ctl17$PasswordRecovery1">User Name or E-mail is required.</asp:RequiredFieldValidator>
                            </p>
                            
                            <p>
                                <asp:Button ID="SubmitButton" runat="server" CssClass="btn btn-success" CommandName="Submit"
                                    Text="Send"
                                    ValidationGroup="ctl17$PasswordRecovery1" OnClick="SubmitButton_Click" />
                            <asp:Button ID="CancelPushButton" CssClass="btn btn-secondary" runat="server" CausesValidation="False"
                            CommandName="Cancel" OnClick="CancelPushButton_Click" Text="Cancel" />
                            </p>
                        </div>
                    </UserNameTemplate>
                    <SuccessTemplate>
                        <p>Your password has been sent to your E-mail.</p>
                        <asp:HyperLink ID="HyperLink1" NavigateUrl="~/Login.aspx" runat="server">Log in</asp:HyperLink>
                    </SuccessTemplate>
                </asp:PasswordRecovery>
            </div>
        </div>
    </div>
</asp:Content>
