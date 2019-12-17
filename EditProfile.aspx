<%@ Page Title="Edit Profile" Language="C#" MasterPageFile="~/Master/Hikes.Master"
    AutoEventWireup="true" CodeBehind="EditProfile.aspx.cs" Inherits="FamilyHikes2019.EditProfile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderSearch" runat="server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolder1" runat="server">
    <div class=" container-fluid">
        <div class="row">
             <div class="col-lg-4 col-xl-4 col-md-6 ml-lg-5 ml-xl-5">
                 
       <asp:ChangePassword ID="ChangePassword1" runat="server" CssClass="col-lg-12 col-xl-12" 
                    ChangePasswordFailureText="Password incorrect or New Password invalid. New Password length minimum: {0}.">
        <ChangePasswordTemplate>
             <div class="form-group" runat="server">
           <h3>Change Your Password</h3>
             <p style="color: red"><asp:Literal ID="FailureText" runat="server" EnableViewState="False"></asp:Literal></p>
           
                 <p class="mb-1"><asp:Label ID="CurrentPasswordLabel" runat="server"
                AssociatedControlID="CurrentPassword">Password:</asp:Label></p>
                 <p>
           <span class="d-block"><asp:TextBox ID="CurrentPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
               </span>
           <span class="d-block"><asp:RequiredFieldValidator ID="CurrentPasswordRequired" runat="server"
                ControlToValidate="CurrentPassword" ErrorMessage="Password is required."
                ToolTip="Password is required."  Display="Dynamic" ForeColor="Red" ValidationGroup="ChangePassword1">Password is required.</asp:RequiredFieldValidator>
                   </span></p>
           <p class="mb-1"> <asp:Label ID="NewPasswordLabel" runat="server"
                AssociatedControlID="NewPassword">New Password:</asp:Label></p>

            <p>
                 <span class="d-block"><asp:TextBox ID="NewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                     </span>
             <span class="d-block"><asp:RequiredFieldValidator ID="NewPasswordRequired" runat="server"
                ControlToValidate="NewPassword" ErrorMessage="New Password is required."  Display="Dynamic"
                ToolTip="New Password is required." ForeColor="Red" ValidationGroup="ChangePassword1">New Password is required.</asp:RequiredFieldValidator>
</span></p>
           <p class="mb-1"> <asp:Label ID="ConfirmNewPasswordLabel" runat="server"
                AssociatedControlID="ConfirmNewPassword">Confirm New Password:</asp:Label></p>

          <p>
               <span class="d-block"><asp:TextBox ID="ConfirmNewPassword" runat="server" CssClass="form-control" TextMode="Password"></asp:TextBox>
                   </span>
            <span class="d-block"><asp:RequiredFieldValidator ID="ConfirmNewPasswordRequired" runat="server"
                ControlToValidate="ConfirmNewPassword"
                ErrorMessage="Confirm New Password is required."
                ToolTip="Confirm New Password is required."  Display="Dynamic" ForeColor="Red" ValidationGroup="ChangePassword1">
                Confirm New Password is required.</asp:RequiredFieldValidator>
              <asp:CompareValidator ID="NewPasswordCompare" runat="server"
                ControlToCompare="NewPassword" ControlToValidate="ConfirmNewPassword"
                Display="Dynamic"
                ErrorMessage="The Confirm New Password must match the New Password entry."
                ValidationGroup="ChangePassword1" ForeColor="Red">
                The Confirm New Password must match the New Password entry.</asp:CompareValidator>
              </span></p>                       
          <p><asp:Button ID="ChangePasswordPushButton" CssClass="btn btn-success mb-2" runat="server"
                CommandName="ChangePassword" Text="Change Password"
                ValidationGroup="ChangePassword1"/> 
              <asp:Button ID="CancelPushButton" CssClass="btn btn-secondary mb-2" runat="server" CausesValidation="False"
                CommandName="Cancel" Text="Cancel" /></p>
                 </div>
        </ChangePasswordTemplate>
           <SuccessTemplate>
               <p>Your password has been changed.</p>                             
           </SuccessTemplate>
    </asp:ChangePassword>

                  <%-- Password recovery --%>
                <div class="mb-3">
                    <asp:LinkButton ID="link_lostPassword" runat="server"
                        OnClick="link_lostPassword_Click">Password Help</asp:LinkButton>
                </div>

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
                            CommandName="Cancel" Text="Cancel" OnClick="CancelPushButton_Click"/>
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
